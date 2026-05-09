; DESCRIPTION: Places a black 29x118 rectangle at position (136, 111).
; PLAN: r0=136(x), r1=111(y), r2=29(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 111
LDI r2, 29
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
