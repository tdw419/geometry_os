; DESCRIPTION: Places a magenta 98x16 rectangle at position (63, 77).
; PLAN: r0=63(x), r1=77(y), r2=98(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 77
LDI r2, 98
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
