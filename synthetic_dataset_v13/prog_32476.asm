; DESCRIPTION: Renders a white box of size 83x74 starting at (332, 111).
; PLAN: r0=332(x), r1=111(y), r2=83(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 111
LDI r2, 83
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
