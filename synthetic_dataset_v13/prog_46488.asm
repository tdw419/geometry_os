; DESCRIPTION: Places a blue 105x40 rectangle at position (219, 129).
; PLAN: r0=219(x), r1=129(y), r2=105(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 129
LDI r2, 105
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
