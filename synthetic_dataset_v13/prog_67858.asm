; DESCRIPTION: Places a white dot at position (465, 230).
; PLAN: r0=465(x), r1=230(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 465
LDI r1, 230
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
