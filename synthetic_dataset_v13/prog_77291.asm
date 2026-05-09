; DESCRIPTION: Places a blue dot at position (123, 164).
; PLAN: r0=123(x), r1=164(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 123
LDI r1, 164
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
