; DESCRIPTION: Places a purple 69x110 rectangle at position (81, 134).
; PLAN: r0=81(x), r1=134(y), r2=69(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 134
LDI r2, 69
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
