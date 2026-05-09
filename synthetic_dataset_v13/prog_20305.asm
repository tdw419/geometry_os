; DESCRIPTION: Composite: Draws a cyan circle centered at (251, 130) with radius 53 then Sets a single purple pixel at (157, 247) then Renders a cyan line between points (83, 75) and (288, 83).
; PLAN: r0=251(x), r1=130(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=247(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=83(x1), r11=75(y1), r12=288(x2), r13=83(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 130
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 247
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 83
LDI r11, 75
LDI r12, 288
LDI r13, 83
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
