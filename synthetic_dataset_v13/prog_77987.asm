; DESCRIPTION: Renders a magenta box of size 99x69 starting at (342, 96).
; PLAN: r0=342(x), r1=96(y), r2=99(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 96
LDI r2, 99
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
