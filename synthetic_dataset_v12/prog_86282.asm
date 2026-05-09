; DESCRIPTION: Renders a magenta box of size 72x116 starting at (234, 49).
; PLAN: r0=234(x), r1=49(y), r2=72(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 49
LDI r2, 72
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
