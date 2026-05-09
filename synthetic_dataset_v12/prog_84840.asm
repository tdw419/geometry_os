; DESCRIPTION: Places a purple 31x80 rectangle at position (188, 142).
; PLAN: r0=188(x), r1=142(y), r2=31(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 142
LDI r2, 31
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
