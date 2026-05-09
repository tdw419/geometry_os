; DESCRIPTION: Sets a single orange pixel at (69, 150).
; PLAN: r0=69(x), r1=150(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 150
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
