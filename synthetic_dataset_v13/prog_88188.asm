; DESCRIPTION: Places a magenta 85x31 rectangle at position (156, 172).
; PLAN: r0=156(x), r1=172(y), r2=85(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 172
LDI r2, 85
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
