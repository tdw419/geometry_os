; DESCRIPTION: Places a purple 117x33 rectangle at position (342, 90).
; PLAN: r0=342(x), r1=90(y), r2=117(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 90
LDI r2, 117
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
