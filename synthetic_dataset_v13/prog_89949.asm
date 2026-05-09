; DESCRIPTION: Places a yellow dot at position (449, 173).
; PLAN: r0=449(x), r1=173(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 449
LDI r1, 173
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
