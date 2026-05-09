; DESCRIPTION: Composite: Places a magenta dot at position (383, 243) then Places a cyan circle of radius 51 at center (299, 185).
; PLAN: r0=383(x), r1=243(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=185(y), r7=51(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 383
LDI r1, 243
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 299
LDI r6, 185
LDI r7, 51
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
