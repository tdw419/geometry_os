; DESCRIPTION: Renders a green box of size 25x112 starting at (177, 56).
; PLAN: r0=177(x), r1=56(y), r2=25(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 56
LDI r2, 25
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
