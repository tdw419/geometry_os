; DESCRIPTION: Places a blue 17x112 rectangle at position (424, 110).
; PLAN: r0=424(x), r1=110(y), r2=17(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 110
LDI r2, 17
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
