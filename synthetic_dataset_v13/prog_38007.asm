; DESCRIPTION: Renders a magenta box of size 19x70 starting at (226, 60).
; PLAN: r0=226(x), r1=60(y), r2=19(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 60
LDI r2, 19
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
