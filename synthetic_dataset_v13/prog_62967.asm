; DESCRIPTION: Renders a magenta box of size 22x109 starting at (79, 67).
; PLAN: r0=79(x), r1=67(y), r2=22(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 67
LDI r2, 22
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
