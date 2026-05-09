; DESCRIPTION: Composite: Places a cyan circle of radius 39 at center (429, 178) then Places a black dot at position (383, 202).
; PLAN: r0=429(x), r1=178(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=202(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 429
LDI r1, 178
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 202
LDI r7, 0x000000
PSET r5, r6, r7
HALT
