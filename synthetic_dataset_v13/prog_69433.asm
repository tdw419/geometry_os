; DESCRIPTION: Renders a magenta box of size 33x116 starting at (472, 96).
; PLAN: r0=472(x), r1=96(y), r2=33(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 96
LDI r2, 33
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
