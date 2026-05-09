; DESCRIPTION: Renders a white box of size 85x62 starting at (156, 111).
; PLAN: r0=156(x), r1=111(y), r2=85(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 111
LDI r2, 85
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
