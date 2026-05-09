; DESCRIPTION: Places a yellow 90x16 rectangle at position (359, 181).
; PLAN: r0=359(x), r1=181(y), r2=90(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 181
LDI r2, 90
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
