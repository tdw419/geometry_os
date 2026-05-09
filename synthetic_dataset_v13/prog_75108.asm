; DESCRIPTION: Places a magenta 31x67 rectangle at position (160, 111).
; PLAN: r0=160(x), r1=111(y), r2=31(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 111
LDI r2, 31
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
