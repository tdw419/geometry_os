; DESCRIPTION: Places a magenta 120x20 rectangle at position (9, 180).
; PLAN: r0=9(x), r1=180(y), r2=120(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 180
LDI r2, 120
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
