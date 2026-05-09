; DESCRIPTION: Composite: Renders a blue line between points (338, 14) and (355, 55) then Renders a white box of size 113x120 starting at (193, 14) then Sets a single orange pixel at (251, 130).
; PLAN: r0=338(x1), r1=14(y1), r2=355(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=14(y), r7=113(width), r8=120(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=251(x), r11=130(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 338
LDI r1, 14
LDI r2, 355
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 14
LDI r7, 113
LDI r8, 120
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 130
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
