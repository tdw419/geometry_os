; DESCRIPTION: Places a black 56x75 rectangle at position (31, 111).
; PLAN: r0=31(x), r1=111(y), r2=56(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 111
LDI r2, 56
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
