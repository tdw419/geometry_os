; DESCRIPTION: Places a purple 79x53 rectangle at position (102, 192).
; PLAN: r0=102(x), r1=192(y), r2=79(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 192
LDI r2, 79
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
