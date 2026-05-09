; DESCRIPTION: Places a purple 95x43 rectangle at position (25, 196).
; PLAN: r0=25(x), r1=196(y), r2=95(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 196
LDI r2, 95
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
