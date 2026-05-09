; DESCRIPTION: Composite: Renders a white line between points (158, 157) and (45, 6) then Draws a white circle centered at (224, 75) with radius 33 then Sets a single green pixel at (393, 27).
; PLAN: r0=158(x1), r1=157(y1), r2=45(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=75(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=393(x), r11=27(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 158
LDI r1, 157
LDI r2, 45
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 75
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 393
LDI r11, 27
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
