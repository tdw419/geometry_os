; DESCRIPTION: Places a magenta 34x24 rectangle at position (448, 19).
; PLAN: r0=448(x), r1=19(y), r2=34(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 19
LDI r2, 34
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
