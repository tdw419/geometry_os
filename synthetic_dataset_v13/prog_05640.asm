; DESCRIPTION: Places a orange 52x66 rectangle at position (250, 111).
; PLAN: r0=250(x), r1=111(y), r2=52(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 111
LDI r2, 52
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
