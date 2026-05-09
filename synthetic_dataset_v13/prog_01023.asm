; DESCRIPTION: Renders a magenta box of size 61x119 starting at (223, 44).
; PLAN: r0=223(x), r1=44(y), r2=61(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 44
LDI r2, 61
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
