; DESCRIPTION: Places a magenta 20x52 rectangle at position (461, 120).
; PLAN: r0=461(x), r1=120(y), r2=20(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 120
LDI r2, 20
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
