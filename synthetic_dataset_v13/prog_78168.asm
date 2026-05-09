; DESCRIPTION: Places a purple 107x22 rectangle at position (260, 119).
; PLAN: r0=260(x), r1=119(y), r2=107(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 119
LDI r2, 107
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
