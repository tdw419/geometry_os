; DESCRIPTION: Composite: Draws a orange circle centered at (413, 195) with radius 48 then Renders a yellow line between points (92, 157) and (224, 55) then Sets a single black pixel at (358, 237).
; PLAN: r0=413(x), r1=195(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x1), r6=157(y1), r7=224(x2), r8=55(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=358(x), r11=237(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 413
LDI r1, 195
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 157
LDI r7, 224
LDI r8, 55
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 237
LDI r12, 0x000000
PSET r10, r11, r12
HALT
