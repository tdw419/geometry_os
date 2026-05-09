; DESCRIPTION: Renders a magenta box of size 58x107 starting at (247, 46).
; PLAN: r0=247(x), r1=46(y), r2=58(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 46
LDI r2, 58
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
