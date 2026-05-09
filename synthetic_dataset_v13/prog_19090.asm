; DESCRIPTION: Places a yellow dot at position (482, 214).
; PLAN: r0=482(x), r1=214(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 482
LDI r1, 214
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
