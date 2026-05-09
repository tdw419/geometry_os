; DESCRIPTION: Composite: Sets a single blue pixel at (500, 226) then Places a purple circle of radius 58 at center (180, 92).
; PLAN: r0=500(x), r1=226(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=92(y), r7=58(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 500
LDI r1, 226
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 180
LDI r6, 92
LDI r7, 58
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
