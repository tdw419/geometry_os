; DESCRIPTION: Places a blue dot at position (503, 60).
; PLAN: r0=503(x), r1=60(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 503
LDI r1, 60
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
