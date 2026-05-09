; DESCRIPTION: Places a purple 79x28 rectangle at position (138, 178).
; PLAN: r0=138(x), r1=178(y), r2=79(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 178
LDI r2, 79
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
