; DESCRIPTION: Places a purple 116x112 rectangle at position (17, 19).
; PLAN: r0=17(x), r1=19(y), r2=116(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 19
LDI r2, 116
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
