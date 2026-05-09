; DESCRIPTION: Composite: Sets a single orange pixel at (185, 156) then Renders a orange disk with center (198, 74) and radius 31 then Places a red 115x48 rectangle at position (224, 112).
; PLAN: r0=185(x), r1=156(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=198(x), r6=74(y), r7=31(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=224(x), r11=112(y), r12=115(width), r13=48(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 156
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 198
LDI r6, 74
LDI r7, 31
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 224
LDI r11, 112
LDI r12, 115
LDI r13, 48
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
