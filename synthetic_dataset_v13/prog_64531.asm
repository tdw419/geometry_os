; DESCRIPTION: Places a purple 103x106 rectangle at position (234, 114).
; PLAN: r0=234(x), r1=114(y), r2=103(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 114
LDI r2, 103
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
