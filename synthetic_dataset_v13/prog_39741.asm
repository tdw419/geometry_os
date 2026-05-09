; DESCRIPTION: Places a blue 71x92 rectangle at position (381, 111).
; PLAN: r0=381(x), r1=111(y), r2=71(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 111
LDI r2, 71
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
