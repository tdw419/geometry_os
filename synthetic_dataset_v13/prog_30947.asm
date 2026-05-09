; DESCRIPTION: Renders a magenta box of size 112x117 starting at (103, 10).
; PLAN: r0=103(x), r1=10(y), r2=112(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 10
LDI r2, 112
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
