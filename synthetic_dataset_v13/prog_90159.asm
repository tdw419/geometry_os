; DESCRIPTION: Renders a magenta box of size 54x22 starting at (100, 146).
; PLAN: r0=100(x), r1=146(y), r2=54(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 146
LDI r2, 54
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
