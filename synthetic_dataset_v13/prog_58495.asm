; DESCRIPTION: Places a blue 88x72 rectangle at position (325, 111).
; PLAN: r0=325(x), r1=111(y), r2=88(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 111
LDI r2, 88
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
