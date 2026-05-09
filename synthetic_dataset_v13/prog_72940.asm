; DESCRIPTION: Sets a single cyan pixel at (506, 156).
; PLAN: r0=506(x), r1=156(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 506
LDI r1, 156
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
