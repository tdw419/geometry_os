; DESCRIPTION: Renders a magenta box of size 86x57 starting at (121, 175).
; PLAN: r0=121(x), r1=175(y), r2=86(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 175
LDI r2, 86
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
