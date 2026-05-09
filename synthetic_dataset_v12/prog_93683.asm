; DESCRIPTION: Renders a magenta box of size 40x48 starting at (366, 153).
; PLAN: r0=366(x), r1=153(y), r2=40(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 153
LDI r2, 40
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
