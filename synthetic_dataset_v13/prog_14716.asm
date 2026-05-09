; DESCRIPTION: Places a green dot at position (356, 111).
; PLAN: r0=356(x), r1=111(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 356
LDI r1, 111
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
