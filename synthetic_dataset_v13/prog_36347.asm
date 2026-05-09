; DESCRIPTION: Places a red 49x52 rectangle at position (377, 22).
; PLAN: r0=377(x), r1=22(y), r2=49(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 22
LDI r2, 49
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
