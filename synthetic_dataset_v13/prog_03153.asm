; DESCRIPTION: Places a blue 68x23 rectangle at position (172, 111).
; PLAN: r0=172(x), r1=111(y), r2=68(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 111
LDI r2, 68
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
