; DESCRIPTION: Places a blue dot at position (59, 111).
; PLAN: r0=59(x), r1=111(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 111
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
