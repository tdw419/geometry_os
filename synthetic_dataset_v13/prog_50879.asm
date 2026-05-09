; DESCRIPTION: Renders a magenta box of size 118x91 starting at (369, 109).
; PLAN: r0=369(x), r1=109(y), r2=118(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 109
LDI r2, 118
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
