; DESCRIPTION: Places a orange 90x60 rectangle at position (359, 157).
; PLAN: r0=359(x), r1=157(y), r2=90(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 157
LDI r2, 90
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
