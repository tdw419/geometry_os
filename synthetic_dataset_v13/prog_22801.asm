; DESCRIPTION: Composite: Sets a single magenta pixel at (491, 27) then Renders a cyan disk with center (224, 121) and radius 27 then Renders a white line between points (496, 115) and (188, 91).
; PLAN: r0=491(x), r1=27(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=224(x), r6=121(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=496(x1), r11=115(y1), r12=188(x2), r13=91(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 491
LDI r1, 27
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 224
LDI r6, 121
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 496
LDI r11, 115
LDI r12, 188
LDI r13, 91
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
