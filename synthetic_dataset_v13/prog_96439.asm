; DESCRIPTION: Composite: Creates a purple circular shape at (356, 75) with radius 55 then Draws a cyan line from (22, 174) to (475, 150) then Sets a single orange pixel at (467, 141).
; PLAN: r0=356(x), r1=75(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x1), r6=174(y1), r7=475(x2), r8=150(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=467(x), r11=141(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 356
LDI r1, 75
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 174
LDI r7, 475
LDI r8, 150
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 467
LDI r11, 141
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
