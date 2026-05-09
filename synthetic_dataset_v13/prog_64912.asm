; DESCRIPTION: Composite: Sets a single purple pixel at (273, 226) then Places a blue circle of radius 47 at center (217, 126).
; PLAN: r0=273(x), r1=226(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=126(y), r7=47(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 273
LDI r1, 226
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 126
LDI r7, 47
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
