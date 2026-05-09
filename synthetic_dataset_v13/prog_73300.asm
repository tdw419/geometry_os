; DESCRIPTION: Renders a white box of size 76x18 starting at (227, 111).
; PLAN: r0=227(x), r1=111(y), r2=76(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 111
LDI r2, 76
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
