; DESCRIPTION: Places a yellow 31x119 rectangle at position (233, 111).
; PLAN: r0=233(x), r1=111(y), r2=31(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 111
LDI r2, 31
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
