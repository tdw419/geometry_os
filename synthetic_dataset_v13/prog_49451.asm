; DESCRIPTION: Places a purple 116x11 rectangle at position (63, 241).
; PLAN: r0=63(x), r1=241(y), r2=116(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 241
LDI r2, 116
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
