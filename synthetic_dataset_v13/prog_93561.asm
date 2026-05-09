; DESCRIPTION: Places a orange 119x106 rectangle at position (185, 54).
; PLAN: r0=185(x), r1=54(y), r2=119(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 54
LDI r2, 119
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
