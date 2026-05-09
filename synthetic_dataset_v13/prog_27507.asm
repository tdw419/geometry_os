; DESCRIPTION: Places a purple 105x29 rectangle at position (361, 138).
; PLAN: r0=361(x), r1=138(y), r2=105(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 138
LDI r2, 105
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
