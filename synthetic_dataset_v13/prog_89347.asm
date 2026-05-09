; DESCRIPTION: Renders a magenta box of size 25x109 starting at (14, 11).
; PLAN: r0=14(x), r1=11(y), r2=25(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 11
LDI r2, 25
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
