; DESCRIPTION: Renders a magenta box of size 25x112 starting at (235, 17).
; PLAN: r0=235(x), r1=17(y), r2=25(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 17
LDI r2, 25
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
