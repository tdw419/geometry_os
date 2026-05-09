; DESCRIPTION: Places a blue 83x95 rectangle at position (178, 97).
; PLAN: r0=178(x), r1=97(y), r2=83(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 97
LDI r2, 83
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
