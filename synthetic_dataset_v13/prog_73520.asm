; DESCRIPTION: Places a blue 110x106 rectangle at position (204, 111).
; PLAN: r0=204(x), r1=111(y), r2=110(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 111
LDI r2, 110
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
