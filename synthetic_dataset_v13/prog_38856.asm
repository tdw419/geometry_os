; DESCRIPTION: Sets a single cyan pixel at (348, 154).
; PLAN: r0=348(x), r1=154(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 348
LDI r1, 154
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
