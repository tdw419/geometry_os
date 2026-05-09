; DESCRIPTION: Composite: Renders a white box of size 107x28 starting at (45, 132) then Sets a single cyan pixel at (75, 89) then Renders a orange disk with center (277, 78) and radius 50.
; PLAN: r0=45(x), r1=132(y), r2=107(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=89(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=277(x), r11=78(y), r12=50(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 45
LDI r1, 132
LDI r2, 107
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 89
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 277
LDI r11, 78
LDI r12, 50
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
