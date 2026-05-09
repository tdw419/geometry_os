; DESCRIPTION: Renders a magenta box of size 118x13 starting at (185, 240).
; PLAN: r0=185(x), r1=240(y), r2=118(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 240
LDI r2, 118
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
