; DESCRIPTION: Composite: Renders a white box of size 104x11 starting at (103, 147) then Sets a single white pixel at (289, 74).
; PLAN: r0=103(x), r1=147(y), r2=104(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=74(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 103
LDI r1, 147
LDI r2, 104
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 74
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
