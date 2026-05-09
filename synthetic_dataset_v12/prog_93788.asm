; DESCRIPTION: Places a orange 60x106 rectangle at position (423, 48).
; PLAN: r0=423(x), r1=48(y), r2=60(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 48
LDI r2, 60
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
