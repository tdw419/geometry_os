; DESCRIPTION: Places a blue 83x81 rectangle at position (251, 157).
; PLAN: r0=251(x), r1=157(y), r2=83(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 157
LDI r2, 83
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
