; DESCRIPTION: Places a cyan dot at position (400, 252).
; PLAN: r0=400(x), r1=252(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 400
LDI r1, 252
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
