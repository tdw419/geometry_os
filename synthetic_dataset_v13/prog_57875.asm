; DESCRIPTION: Places a purple 82x112 rectangle at position (132, 33).
; PLAN: r0=132(x), r1=33(y), r2=82(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 33
LDI r2, 82
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
