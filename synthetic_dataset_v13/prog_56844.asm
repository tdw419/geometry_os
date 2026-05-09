; DESCRIPTION: Places a green 14x61 rectangle at position (421, 111).
; PLAN: r0=421(x), r1=111(y), r2=14(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 111
LDI r2, 14
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
