; DESCRIPTION: Renders a magenta box of size 90x54 starting at (369, 92).
; PLAN: r0=369(x), r1=92(y), r2=90(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 92
LDI r2, 90
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
