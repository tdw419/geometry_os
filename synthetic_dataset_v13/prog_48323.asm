; DESCRIPTION: Composite: Creates a black rectangular region at (11, 93) spanning 85 by 120 pixels then Places a black line segment connecting (37, 42) to (119, 100) then Sets a single orange pixel at (256, 192).
; PLAN: r0=11(x), r1=93(y), r2=85(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x1), r6=42(y1), r7=119(x2), r8=100(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=256(x), r11=192(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 11
LDI r1, 93
LDI r2, 85
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 42
LDI r7, 119
LDI r8, 100
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 192
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
