; DESCRIPTION: Places a purple 114x105 rectangle at position (260, 5).
; PLAN: r0=260(x), r1=5(y), r2=114(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 5
LDI r2, 114
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
