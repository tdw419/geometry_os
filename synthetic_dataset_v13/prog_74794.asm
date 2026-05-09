; DESCRIPTION: Renders a magenta box of size 61x23 starting at (33, 165).
; PLAN: r0=33(x), r1=165(y), r2=61(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 165
LDI r2, 61
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
