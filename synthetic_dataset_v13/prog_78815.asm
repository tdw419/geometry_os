; DESCRIPTION: Renders a magenta box of size 106x68 starting at (88, 174).
; PLAN: r0=88(x), r1=174(y), r2=106(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 174
LDI r2, 106
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
