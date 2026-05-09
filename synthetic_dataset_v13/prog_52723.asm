; DESCRIPTION: Places a purple 73x38 rectangle at position (234, 28).
; PLAN: r0=234(x), r1=28(y), r2=73(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 28
LDI r2, 73
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
