; DESCRIPTION: Places a green 89x97 rectangle at position (211, 111).
; PLAN: r0=211(x), r1=111(y), r2=89(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 111
LDI r2, 89
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
