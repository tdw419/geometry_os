; DESCRIPTION: Renders a magenta box of size 92x102 starting at (396, 128).
; PLAN: r0=396(x), r1=128(y), r2=92(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 128
LDI r2, 92
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
