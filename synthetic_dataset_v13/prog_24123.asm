; DESCRIPTION: Places a purple 56x69 rectangle at position (162, 165).
; PLAN: r0=162(x), r1=165(y), r2=56(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 165
LDI r2, 56
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
