; DESCRIPTION: Places a red dot at position (278, 213).
; PLAN: r0=278(x), r1=213(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 278
LDI r1, 213
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
