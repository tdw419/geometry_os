; DESCRIPTION: Places a orange dot at position (401, 190).
; PLAN: r0=401(x), r1=190(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 401
LDI r1, 190
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
