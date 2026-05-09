; DESCRIPTION: Composite: Places a blue circle of radius 79 at center (394, 117) then Sets a single yellow pixel at (113, 249).
; PLAN: r0=394(x), r1=117(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=113(x), r6=249(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 394
LDI r1, 117
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 113
LDI r6, 249
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
