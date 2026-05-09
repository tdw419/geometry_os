; DESCRIPTION: Composite: Renders a green box of size 56x100 starting at (417, 77) then Places a purple line segment connecting (15, 229) to (415, 219) then Places a magenta dot at position (347, 161).
; PLAN: r0=417(x), r1=77(y), r2=56(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x1), r6=229(y1), r7=415(x2), r8=219(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=347(x), r11=161(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 417
LDI r1, 77
LDI r2, 56
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 229
LDI r7, 415
LDI r8, 219
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 161
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
