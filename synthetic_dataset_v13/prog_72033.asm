; DESCRIPTION: Renders a magenta box of size 21x35 starting at (250, 172).
; PLAN: r0=250(x), r1=172(y), r2=21(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 172
LDI r2, 21
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
