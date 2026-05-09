; DESCRIPTION: Renders a yellow box of size 83x111 starting at (122, 111).
; PLAN: r0=122(x), r1=111(y), r2=83(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 111
LDI r2, 83
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
