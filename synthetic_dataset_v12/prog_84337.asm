; DESCRIPTION: Composite: Places a red circle of radius 79 at center (173, 125) then Sets a single yellow pixel at (25, 248).
; PLAN: r0=173(x), r1=125(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x), r6=248(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 173
LDI r1, 125
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 248
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
