; DESCRIPTION: Places a purple 59x106 rectangle at position (453, 101).
; PLAN: r0=453(x), r1=101(y), r2=59(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 101
LDI r2, 59
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
