; DESCRIPTION: Composite: Places a magenta line segment connecting (401, 9) to (481, 165) then Places a white dot at position (94, 200) then Draws a green rectangle at (117, 108) with width 34 and height 12.
; PLAN: r0=401(x1), r1=9(y1), r2=481(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=94(x), r6=200(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=117(x), r11=108(y), r12=34(width), r13=12(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 9
LDI r2, 481
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 200
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 117
LDI r11, 108
LDI r12, 34
LDI r13, 12
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
