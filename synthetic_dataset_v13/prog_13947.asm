; DESCRIPTION: Composite: Sets a single cyan pixel at (189, 251) then Creates a blue circular shape at (224, 98) with radius 48 then Renders a magenta line between points (72, 7) and (53, 170).
; PLAN: r0=189(x), r1=251(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=224(x), r6=98(y), r7=48(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=72(x1), r11=7(y1), r12=53(x2), r13=170(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 251
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 224
LDI r6, 98
LDI r7, 48
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 72
LDI r11, 7
LDI r12, 53
LDI r13, 170
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
