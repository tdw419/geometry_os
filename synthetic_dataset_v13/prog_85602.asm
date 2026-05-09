; DESCRIPTION: Places a cyan dot at position (179, 169).
; PLAN: r0=179(x), r1=169(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 169
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
