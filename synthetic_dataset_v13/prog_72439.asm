; DESCRIPTION: Places a purple 33x87 rectangle at position (80, 69).
; PLAN: r0=80(x), r1=69(y), r2=33(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 69
LDI r2, 33
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
