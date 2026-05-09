; DESCRIPTION: Renders a white box of size 108x53 starting at (375, 111).
; PLAN: r0=375(x), r1=111(y), r2=108(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 111
LDI r2, 108
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
