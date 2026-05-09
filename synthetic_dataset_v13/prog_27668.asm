; DESCRIPTION: Places a white dot at position (175, 151).
; PLAN: r0=175(x), r1=151(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 151
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
