; DESCRIPTION: Renders a blue box of size 77x94 starting at (62, 111).
; PLAN: r0=62(x), r1=111(y), r2=77(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 111
LDI r2, 77
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
