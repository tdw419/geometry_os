; DESCRIPTION: Composite: Places a black line segment connecting (88, 193) to (245, 139) then Places a red 10x12 rectangle at position (150, 85) then Sets a single green pixel at (462, 115).
; PLAN: r0=88(x1), r1=193(y1), r2=245(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=85(y), r7=10(width), r8=12(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=462(x), r11=115(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 88
LDI r1, 193
LDI r2, 245
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 85
LDI r7, 10
LDI r8, 12
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 115
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
