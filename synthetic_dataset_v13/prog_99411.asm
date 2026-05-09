; DESCRIPTION: Places a purple 20x99 rectangle at position (462, 142).
; PLAN: r0=462(x), r1=142(y), r2=20(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 142
LDI r2, 20
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
