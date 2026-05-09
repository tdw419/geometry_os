; DESCRIPTION: Places a magenta dot at position (507, 226).
; PLAN: r0=507(x), r1=226(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 507
LDI r1, 226
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
