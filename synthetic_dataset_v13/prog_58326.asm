; DESCRIPTION: Renders a magenta box of size 70x44 starting at (353, 133).
; PLAN: r0=353(x), r1=133(y), r2=70(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 133
LDI r2, 70
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
