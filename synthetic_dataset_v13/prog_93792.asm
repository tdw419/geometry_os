; DESCRIPTION: Places a white dot at position (434, 158).
; PLAN: r0=434(x), r1=158(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 434
LDI r1, 158
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
