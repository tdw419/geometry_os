; DESCRIPTION: Places a red dot at position (117, 196).
; PLAN: r0=117(x), r1=196(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 196
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
