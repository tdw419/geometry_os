; DESCRIPTION: Places a green dot at position (482, 12).
; PLAN: r0=482(x), r1=12(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 482
LDI r1, 12
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
