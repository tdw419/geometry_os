; DESCRIPTION: Places a purple 31x116 rectangle at position (74, 76).
; PLAN: r0=74(x), r1=76(y), r2=31(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 76
LDI r2, 31
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
