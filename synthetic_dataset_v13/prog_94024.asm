; DESCRIPTION: Composite: Places a red dot at position (422, 102) then Places a cyan circle of radius 40 at center (368, 44).
; PLAN: r0=422(x), r1=102(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=44(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 102
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 368
LDI r6, 44
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
