; DESCRIPTION: Places a cyan dot at position (169, 188).
; PLAN: r0=169(x), r1=188(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 188
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
