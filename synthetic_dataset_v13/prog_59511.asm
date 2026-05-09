; DESCRIPTION: Places a purple 105x102 rectangle at position (270, 43).
; PLAN: r0=270(x), r1=43(y), r2=105(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 43
LDI r2, 105
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
