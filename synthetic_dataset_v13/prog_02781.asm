; DESCRIPTION: Renders a red box of size 26x20 starting at (326, 111).
; PLAN: r0=326(x), r1=111(y), r2=26(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 111
LDI r2, 26
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
