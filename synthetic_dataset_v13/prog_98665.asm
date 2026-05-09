; DESCRIPTION: Places a magenta 85x56 rectangle at position (140, 168).
; PLAN: r0=140(x), r1=168(y), r2=85(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 168
LDI r2, 85
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
