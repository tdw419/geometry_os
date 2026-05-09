; DESCRIPTION: Places a magenta 52x29 rectangle at position (105, 117).
; PLAN: r0=105(x), r1=117(y), r2=52(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 117
LDI r2, 52
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
