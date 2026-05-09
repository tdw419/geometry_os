; DESCRIPTION: Places a purple 33x105 rectangle at position (423, 61).
; PLAN: r0=423(x), r1=61(y), r2=33(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 61
LDI r2, 33
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
