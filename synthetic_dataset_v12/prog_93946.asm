; DESCRIPTION: Places a purple 81x80 rectangle at position (132, 129).
; PLAN: r0=132(x), r1=129(y), r2=81(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 129
LDI r2, 81
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
