; DESCRIPTION: Places a white dot at position (345, 127).
; PLAN: r0=345(x), r1=127(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 345
LDI r1, 127
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
