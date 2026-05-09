; DESCRIPTION: Places a green dot at position (281, 107).
; PLAN: r0=281(x), r1=107(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 281
LDI r1, 107
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
