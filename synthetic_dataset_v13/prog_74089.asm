; DESCRIPTION: Places a magenta 16x34 rectangle at position (188, 75).
; PLAN: r0=188(x), r1=75(y), r2=16(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 75
LDI r2, 16
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
