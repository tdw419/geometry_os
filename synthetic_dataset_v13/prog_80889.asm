; DESCRIPTION: Renders a magenta box of size 48x73 starting at (300, 136).
; PLAN: r0=300(x), r1=136(y), r2=48(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 136
LDI r2, 48
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
