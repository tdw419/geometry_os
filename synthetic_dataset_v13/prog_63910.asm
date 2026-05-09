; DESCRIPTION: Renders a magenta box of size 72x54 starting at (65, 185).
; PLAN: r0=65(x), r1=185(y), r2=72(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 185
LDI r2, 72
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
