; DESCRIPTION: Places a purple 112x33 rectangle at position (10, 215).
; PLAN: r0=10(x), r1=215(y), r2=112(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 215
LDI r2, 112
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
