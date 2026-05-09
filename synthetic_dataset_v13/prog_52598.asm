; DESCRIPTION: Renders a magenta box of size 33x85 starting at (188, 65).
; PLAN: r0=188(x), r1=65(y), r2=33(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 65
LDI r2, 33
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
