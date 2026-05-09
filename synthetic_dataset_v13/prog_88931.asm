; DESCRIPTION: Places a magenta 74x98 rectangle at position (133, 144).
; PLAN: r0=133(x), r1=144(y), r2=74(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 144
LDI r2, 74
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
