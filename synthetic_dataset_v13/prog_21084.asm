; DESCRIPTION: Places a black 112x115 rectangle at position (55, 111).
; PLAN: r0=55(x), r1=111(y), r2=112(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 111
LDI r2, 112
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
