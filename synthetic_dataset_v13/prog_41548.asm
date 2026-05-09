; DESCRIPTION: Places a black dot at position (502, 32).
; PLAN: r0=502(x), r1=32(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 502
LDI r1, 32
LDI r2, 0x000000
PSET r0, r1, r2
HALT
