; DESCRIPTION: Places a orange 109x25 rectangle at position (359, 121).
; PLAN: r0=359(x), r1=121(y), r2=109(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 121
LDI r2, 109
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
