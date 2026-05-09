; DESCRIPTION: Renders a magenta box of size 86x29 starting at (339, 150).
; PLAN: r0=339(x), r1=150(y), r2=86(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 150
LDI r2, 86
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
