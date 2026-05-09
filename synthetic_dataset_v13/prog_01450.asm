; DESCRIPTION: Composite: Places a purple dot at position (223, 180) then Places a orange circle of radius 79 at center (255, 140).
; PLAN: r0=223(x), r1=180(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=255(x), r6=140(y), r7=79(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 223
LDI r1, 180
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 255
LDI r6, 140
LDI r7, 79
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
