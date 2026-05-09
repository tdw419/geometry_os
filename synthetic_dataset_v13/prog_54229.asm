; DESCRIPTION: Renders a green box of size 53x65 starting at (158, 111).
; PLAN: r0=158(x), r1=111(y), r2=53(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 111
LDI r2, 53
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
