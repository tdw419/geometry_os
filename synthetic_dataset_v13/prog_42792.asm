; DESCRIPTION: Renders a magenta box of size 17x117 starting at (135, 60).
; PLAN: r0=135(x), r1=60(y), r2=17(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 60
LDI r2, 17
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
