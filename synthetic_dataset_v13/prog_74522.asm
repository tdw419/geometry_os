; DESCRIPTION: Places a purple 102x18 rectangle at position (134, 96).
; PLAN: r0=134(x), r1=96(y), r2=102(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 96
LDI r2, 102
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
