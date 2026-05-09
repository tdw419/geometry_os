; DESCRIPTION: Renders a magenta box of size 84x70 starting at (188, 175).
; PLAN: r0=188(x), r1=175(y), r2=84(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 175
LDI r2, 84
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
