; DESCRIPTION: Places a green 38x62 rectangle at position (201, 111).
; PLAN: r0=201(x), r1=111(y), r2=38(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 111
LDI r2, 38
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
