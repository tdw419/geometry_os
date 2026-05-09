; DESCRIPTION: Places a magenta 14x99 rectangle at position (457, 111).
; PLAN: r0=457(x), r1=111(y), r2=14(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 111
LDI r2, 14
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
