; DESCRIPTION: Renders a magenta box of size 34x73 starting at (283, 165).
; PLAN: r0=283(x), r1=165(y), r2=34(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 165
LDI r2, 34
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
