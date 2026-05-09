; DESCRIPTION: Places a magenta 113x85 rectangle at position (66, 144).
; PLAN: r0=66(x), r1=144(y), r2=113(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 144
LDI r2, 113
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
