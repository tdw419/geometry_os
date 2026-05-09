; DESCRIPTION: Renders a magenta box of size 65x74 starting at (21, 175).
; PLAN: r0=21(x), r1=175(y), r2=65(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 175
LDI r2, 65
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
