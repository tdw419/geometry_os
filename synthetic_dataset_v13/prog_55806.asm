; DESCRIPTION: Composite: Creates a orange circular shape at (368, 147) with radius 28 then Renders a cyan line between points (149, 90) and (421, 253) then Sets a single orange pixel at (356, 104).
; PLAN: r0=368(x), r1=147(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=149(x1), r6=90(y1), r7=421(x2), r8=253(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=356(x), r11=104(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 368
LDI r1, 147
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 149
LDI r6, 90
LDI r7, 421
LDI r8, 253
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 104
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
