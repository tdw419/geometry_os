; DESCRIPTION: Renders a magenta box of size 77x120 starting at (330, 6).
; PLAN: r0=330(x), r1=6(y), r2=77(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 6
LDI r2, 77
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
