; DESCRIPTION: Composite: Places a magenta line segment connecting (231, 116) to (118, 210) then Draws a purple rectangle at (477, 140) with width 16 and height 77 then Renders a cyan disk with center (325, 139) and radius 80.
; PLAN: r0=231(x1), r1=116(y1), r2=118(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=477(x), r6=140(y), r7=16(width), r8=77(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=325(x), r11=139(y), r12=80(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 231
LDI r1, 116
LDI r2, 118
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 140
LDI r7, 16
LDI r8, 77
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 139
LDI r12, 80
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
