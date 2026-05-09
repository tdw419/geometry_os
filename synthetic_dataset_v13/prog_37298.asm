; DESCRIPTION: Places a purple 33x52 rectangle at position (40, 22).
; PLAN: r0=40(x), r1=22(y), r2=33(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 22
LDI r2, 33
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
