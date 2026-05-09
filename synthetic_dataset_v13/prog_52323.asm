; DESCRIPTION: Renders a magenta box of size 51x39 starting at (169, 113).
; PLAN: r0=169(x), r1=113(y), r2=51(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 113
LDI r2, 51
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
