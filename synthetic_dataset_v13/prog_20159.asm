; DESCRIPTION: Composite: Renders a white box of size 79x80 starting at (373, 98) then Sets a single purple pixel at (433, 157).
; PLAN: r0=373(x), r1=98(y), r2=79(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x), r6=157(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 373
LDI r1, 98
LDI r2, 79
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 157
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
