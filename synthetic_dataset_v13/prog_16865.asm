; DESCRIPTION: Places a purple 12x21 rectangle at position (263, 111).
; PLAN: r0=263(x), r1=111(y), r2=12(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 111
LDI r2, 12
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
