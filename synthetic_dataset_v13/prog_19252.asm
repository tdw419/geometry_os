; DESCRIPTION: Renders a white box of size 30x31 starting at (333, 111).
; PLAN: r0=333(x), r1=111(y), r2=30(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 111
LDI r2, 30
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
