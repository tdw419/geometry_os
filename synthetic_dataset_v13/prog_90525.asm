; DESCRIPTION: Renders a blue box of size 49x88 starting at (385, 111).
; PLAN: r0=385(x), r1=111(y), r2=49(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 111
LDI r2, 49
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
