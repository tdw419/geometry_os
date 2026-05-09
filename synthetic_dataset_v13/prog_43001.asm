; DESCRIPTION: Places a magenta 120x88 rectangle at position (52, 121).
; PLAN: r0=52(x), r1=121(y), r2=120(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 121
LDI r2, 120
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
