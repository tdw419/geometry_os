; DESCRIPTION: Renders a magenta box of size 42x58 starting at (94, 168).
; PLAN: r0=94(x), r1=168(y), r2=42(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 168
LDI r2, 42
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
