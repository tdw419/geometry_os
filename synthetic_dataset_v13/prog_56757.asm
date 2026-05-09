; DESCRIPTION: Places a blue dot at position (284, 252).
; PLAN: r0=284(x), r1=252(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 284
LDI r1, 252
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
