; DESCRIPTION: Places a purple 82x100 rectangle at position (33, 84).
; PLAN: r0=33(x), r1=84(y), r2=82(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 84
LDI r2, 82
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
