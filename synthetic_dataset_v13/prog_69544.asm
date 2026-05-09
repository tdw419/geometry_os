; DESCRIPTION: Composite: Places a magenta line segment connecting (192, 255) to (169, 84) then Renders a white box of size 19x93 starting at (217, 25) then Places a white dot at position (234, 162).
; PLAN: r0=192(x1), r1=255(y1), r2=169(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=25(y), r7=19(width), r8=93(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=162(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 192
LDI r1, 255
LDI r2, 169
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 25
LDI r7, 19
LDI r8, 93
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 162
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
