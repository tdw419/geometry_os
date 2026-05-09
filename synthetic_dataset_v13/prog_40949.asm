; DESCRIPTION: Composite: Creates a white circular shape at (274, 112) with radius 51 then Sets a single green pixel at (104, 0) then Renders a green box of size 34x25 starting at (367, 90).
; PLAN: r0=274(x), r1=112(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=0(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=367(x), r11=90(y), r12=34(width), r13=25(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 112
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 0
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 367
LDI r11, 90
LDI r12, 34
LDI r13, 25
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
