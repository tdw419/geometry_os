; DESCRIPTION: Places a magenta 101x117 rectangle at position (180, 120).
; PLAN: r0=180(x), r1=120(y), r2=101(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 120
LDI r2, 101
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
