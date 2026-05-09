; DESCRIPTION: Renders a magenta box of size 73x78 starting at (173, 175).
; PLAN: r0=173(x), r1=175(y), r2=73(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 175
LDI r2, 73
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
