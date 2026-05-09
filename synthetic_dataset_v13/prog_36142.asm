; DESCRIPTION: Places a black 90x115 rectangle at position (278, 111).
; PLAN: r0=278(x), r1=111(y), r2=90(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 111
LDI r2, 90
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
