; DESCRIPTION: Renders a magenta box of size 48x46 starting at (58, 138).
; PLAN: r0=58(x), r1=138(y), r2=48(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 138
LDI r2, 48
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
