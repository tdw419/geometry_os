; DESCRIPTION: Renders a magenta box of size 87x118 starting at (392, 32).
; PLAN: r0=392(x), r1=32(y), r2=87(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 32
LDI r2, 87
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
