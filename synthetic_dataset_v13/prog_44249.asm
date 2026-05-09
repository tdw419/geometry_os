; DESCRIPTION: Places a purple 72x73 rectangle at position (194, 142).
; PLAN: r0=194(x), r1=142(y), r2=72(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 142
LDI r2, 72
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
