; DESCRIPTION: Places a magenta dot at position (359, 111).
; PLAN: r0=359(x), r1=111(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 359
LDI r1, 111
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
