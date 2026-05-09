; DESCRIPTION: Renders a magenta box of size 92x48 starting at (1, 175).
; PLAN: r0=1(x), r1=175(y), r2=92(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 175
LDI r2, 92
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
