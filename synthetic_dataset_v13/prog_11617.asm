; DESCRIPTION: Renders a magenta box of size 56x79 starting at (391, 175).
; PLAN: r0=391(x), r1=175(y), r2=56(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 175
LDI r2, 56
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
