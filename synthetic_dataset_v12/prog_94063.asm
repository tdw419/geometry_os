; DESCRIPTION: Renders a magenta box of size 90x33 starting at (179, 7).
; PLAN: r0=179(x), r1=7(y), r2=90(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 7
LDI r2, 90
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
