; DESCRIPTION: Places a purple 81x43 rectangle at position (44, 31).
; PLAN: r0=44(x), r1=31(y), r2=81(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 31
LDI r2, 81
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
