; DESCRIPTION: Places a purple 17x112 rectangle at position (39, 92).
; PLAN: r0=39(x), r1=92(y), r2=17(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 92
LDI r2, 17
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
