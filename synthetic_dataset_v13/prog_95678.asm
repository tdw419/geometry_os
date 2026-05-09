; DESCRIPTION: Places a green 49x94 rectangle at position (52, 111).
; PLAN: r0=52(x), r1=111(y), r2=49(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 111
LDI r2, 49
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
