; DESCRIPTION: Renders a magenta box of size 31x61 starting at (330, 88).
; PLAN: r0=330(x), r1=88(y), r2=31(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 88
LDI r2, 31
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
