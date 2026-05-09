; DESCRIPTION: Places a purple 11x28 rectangle at position (95, 22).
; PLAN: r0=95(x), r1=22(y), r2=11(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 22
LDI r2, 11
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
