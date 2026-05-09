; DESCRIPTION: Places a purple 105x52 rectangle at position (377, 125).
; PLAN: r0=377(x), r1=125(y), r2=105(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 125
LDI r2, 105
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
