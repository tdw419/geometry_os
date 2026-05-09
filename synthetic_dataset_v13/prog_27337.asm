; DESCRIPTION: Renders a black box of size 31x115 starting at (185, 111).
; PLAN: r0=185(x), r1=111(y), r2=31(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 111
LDI r2, 31
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
