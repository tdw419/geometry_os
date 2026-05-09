; DESCRIPTION: Places a green 31x112 rectangle at position (359, 90).
; PLAN: r0=359(x), r1=90(y), r2=31(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 90
LDI r2, 31
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
