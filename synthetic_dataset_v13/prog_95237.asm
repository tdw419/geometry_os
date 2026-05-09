; DESCRIPTION: Places a purple 17x81 rectangle at position (253, 162).
; PLAN: r0=253(x), r1=162(y), r2=17(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 162
LDI r2, 17
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
