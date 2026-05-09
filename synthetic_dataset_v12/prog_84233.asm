; DESCRIPTION: Composite: Places a purple circle of radius 57 at center (230, 170) then Places a cyan line segment connecting (401, 23) to (108, 135) then Draws a yellow rectangle at (394, 28) with width 115 and height 47.
; PLAN: r0=230(x), r1=170(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x1), r6=23(y1), r7=108(x2), r8=135(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=394(x), r11=28(y), r12=115(width), r13=47(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 170
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 23
LDI r7, 108
LDI r8, 135
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 28
LDI r12, 115
LDI r13, 47
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
