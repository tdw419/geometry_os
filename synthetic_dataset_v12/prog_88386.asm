; DESCRIPTION: Composite: Places a cyan line segment connecting (174, 120) to (27, 50) then Renders a orange disk with center (289, 186) and radius 67 then Sets a single cyan pixel at (83, 211).
; PLAN: r0=174(x1), r1=120(y1), r2=27(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=186(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=83(x), r11=211(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 174
LDI r1, 120
LDI r2, 27
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 186
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 83
LDI r11, 211
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
