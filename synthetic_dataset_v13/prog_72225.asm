; DESCRIPTION: Places a black dot at position (284, 176).
; PLAN: r0=284(x), r1=176(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 284
LDI r1, 176
LDI r2, 0x000000
PSET r0, r1, r2
HALT
