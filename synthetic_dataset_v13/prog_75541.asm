; DESCRIPTION: Places a magenta 42x84 rectangle at position (323, 46).
; PLAN: r0=323(x), r1=46(y), r2=42(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 46
LDI r2, 42
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
