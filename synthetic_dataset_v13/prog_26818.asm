; DESCRIPTION: Places a purple 105x23 rectangle at position (129, 43).
; PLAN: r0=129(x), r1=43(y), r2=105(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 43
LDI r2, 105
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
