; DESCRIPTION: Places a magenta 24x63 rectangle at position (66, 150).
; PLAN: r0=66(x), r1=150(y), r2=24(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 150
LDI r2, 24
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
