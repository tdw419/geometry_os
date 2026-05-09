; DESCRIPTION: Renders a magenta box of size 35x74 starting at (121, 33).
; PLAN: r0=121(x), r1=33(y), r2=35(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 33
LDI r2, 35
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
