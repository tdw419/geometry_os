; DESCRIPTION: Places a white dot at position (447, 253).
; PLAN: r0=447(x), r1=253(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 447
LDI r1, 253
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
