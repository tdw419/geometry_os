; DESCRIPTION: Renders a white box of size 23x108 starting at (469, 111).
; PLAN: r0=469(x), r1=111(y), r2=23(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 111
LDI r2, 23
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
