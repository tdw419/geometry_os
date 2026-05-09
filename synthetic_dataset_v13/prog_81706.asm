; DESCRIPTION: Places a blue dot at position (502, 223).
; PLAN: r0=502(x), r1=223(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 502
LDI r1, 223
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
