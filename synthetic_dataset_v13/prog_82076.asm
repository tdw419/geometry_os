; DESCRIPTION: Places a green dot at position (502, 181).
; PLAN: r0=502(x), r1=181(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 502
LDI r1, 181
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
