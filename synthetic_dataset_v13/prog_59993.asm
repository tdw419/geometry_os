; DESCRIPTION: Places a purple 33x112 rectangle at position (177, 131).
; PLAN: r0=177(x), r1=131(y), r2=33(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 131
LDI r2, 33
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
