; DESCRIPTION: Places a red 97x51 rectangle at position (201, 111).
; PLAN: r0=201(x), r1=111(y), r2=97(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 111
LDI r2, 97
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
