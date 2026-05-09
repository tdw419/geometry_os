; DESCRIPTION: Places a magenta 32x54 rectangle at position (188, 34).
; PLAN: r0=188(x), r1=34(y), r2=32(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 34
LDI r2, 32
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
