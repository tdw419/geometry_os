; DESCRIPTION: Places a magenta dot at position (281, 253).
; PLAN: r0=281(x), r1=253(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 281
LDI r1, 253
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
