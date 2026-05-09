; DESCRIPTION: Places a yellow 119x109 rectangle at position (47, 145).
; PLAN: r0=47(x), r1=145(y), r2=119(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 145
LDI r2, 119
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
