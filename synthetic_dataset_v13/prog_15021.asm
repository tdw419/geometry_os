; DESCRIPTION: Places a purple 33x100 rectangle at position (437, 84).
; PLAN: r0=437(x), r1=84(y), r2=33(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 84
LDI r2, 33
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
