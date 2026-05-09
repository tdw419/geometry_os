; DESCRIPTION: Renders a magenta box of size 61x117 starting at (40, 58).
; PLAN: r0=40(x), r1=58(y), r2=61(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 58
LDI r2, 61
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
