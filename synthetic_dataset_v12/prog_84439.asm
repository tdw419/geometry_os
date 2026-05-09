; DESCRIPTION: Places a white dot at position (116, 231).
; PLAN: r0=116(x), r1=231(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 116
LDI r1, 231
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
