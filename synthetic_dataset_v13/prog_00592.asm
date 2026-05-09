; DESCRIPTION: Renders a magenta box of size 21x80 starting at (22, 24).
; PLAN: r0=22(x), r1=24(y), r2=21(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 24
LDI r2, 21
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
