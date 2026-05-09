; DESCRIPTION: Places a orange dot at position (506, 213).
; PLAN: r0=506(x), r1=213(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 506
LDI r1, 213
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
