; DESCRIPTION: Places a red dot at position (455, 193).
; PLAN: r0=455(x), r1=193(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 455
LDI r1, 193
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
