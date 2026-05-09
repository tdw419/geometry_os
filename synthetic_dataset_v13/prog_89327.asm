; DESCRIPTION: Places a green dot at position (87, 125).
; PLAN: r0=87(x), r1=125(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 125
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
