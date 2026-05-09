; DESCRIPTION: Renders a yellow box of size 30x65 starting at (439, 111).
; PLAN: r0=439(x), r1=111(y), r2=30(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 111
LDI r2, 30
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
