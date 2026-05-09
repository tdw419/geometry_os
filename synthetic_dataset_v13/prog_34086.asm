; DESCRIPTION: Places a purple 106x56 rectangle at position (234, 112).
; PLAN: r0=234(x), r1=112(y), r2=106(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 112
LDI r2, 106
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
