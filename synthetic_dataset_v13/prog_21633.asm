; DESCRIPTION: Places a green dot at position (401, 41).
; PLAN: r0=401(x), r1=41(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 401
LDI r1, 41
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
