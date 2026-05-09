; DESCRIPTION: Renders a magenta box of size 75x29 starting at (324, 45).
; PLAN: r0=324(x), r1=45(y), r2=75(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 45
LDI r2, 75
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
