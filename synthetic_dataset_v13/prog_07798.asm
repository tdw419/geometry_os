; DESCRIPTION: Renders a magenta box of size 113x92 starting at (112, 38).
; PLAN: r0=112(x), r1=38(y), r2=113(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 38
LDI r2, 113
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
