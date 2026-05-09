; DESCRIPTION: Places a purple 57x113 rectangle at position (194, 43).
; PLAN: r0=194(x), r1=43(y), r2=57(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 43
LDI r2, 57
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
