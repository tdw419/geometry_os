; DESCRIPTION: Composite: Places a blue circle of radius 67 at center (218, 151) then Draws a red rectangle at (237, 118) with width 76 and height 59 then Places a cyan line segment connecting (32, 105) to (4, 231).
; PLAN: r0=218(x), r1=151(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=118(y), r7=76(width), r8=59(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=32(x1), r11=105(y1), r12=4(x2), r13=231(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 151
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 118
LDI r7, 76
LDI r8, 59
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 105
LDI r12, 4
LDI r13, 231
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
