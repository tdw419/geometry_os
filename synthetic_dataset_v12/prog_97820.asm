; DESCRIPTION: Renders a magenta box of size 106x113 starting at (252, 85).
; PLAN: r0=252(x), r1=85(y), r2=106(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 85
LDI r2, 106
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
