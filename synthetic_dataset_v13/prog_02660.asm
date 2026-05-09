; DESCRIPTION: Renders a magenta box of size 54x22 starting at (0, 207).
; PLAN: r0=0(x), r1=207(y), r2=54(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 207
LDI r2, 54
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
