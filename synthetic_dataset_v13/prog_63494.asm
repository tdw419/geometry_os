; DESCRIPTION: Places a magenta 60x47 rectangle at position (448, 95).
; PLAN: r0=448(x), r1=95(y), r2=60(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 95
LDI r2, 60
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
