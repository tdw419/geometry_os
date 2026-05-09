; DESCRIPTION: Places a purple 69x19 rectangle at position (250, 52).
; PLAN: r0=250(x), r1=52(y), r2=69(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 52
LDI r2, 69
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
