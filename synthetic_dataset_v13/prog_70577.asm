; DESCRIPTION: Sets a single red pixel at (401, 41).
; PLAN: r0=401(x), r1=41(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 401
LDI r1, 41
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
