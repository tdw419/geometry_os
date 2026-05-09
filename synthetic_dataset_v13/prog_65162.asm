; DESCRIPTION: Composite: Places a purple circle of radius 34 at center (180, 124) then Places a yellow dot at position (459, 168).
; PLAN: r0=180(x), r1=124(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=459(x), r6=168(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 180
LDI r1, 124
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 459
LDI r6, 168
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
