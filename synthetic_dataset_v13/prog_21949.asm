; DESCRIPTION: Renders a magenta box of size 109x106 starting at (180, 7).
; PLAN: r0=180(x), r1=7(y), r2=109(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 7
LDI r2, 109
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
