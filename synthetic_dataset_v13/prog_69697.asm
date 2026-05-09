; DESCRIPTION: Composite: Creates a red circular shape at (358, 185) with radius 59 then Sets a single cyan pixel at (260, 252).
; PLAN: r0=358(x), r1=185(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=252(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 358
LDI r1, 185
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 252
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
