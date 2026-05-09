; DESCRIPTION: Renders a magenta box of size 70x120 starting at (185, 108).
; PLAN: r0=185(x), r1=108(y), r2=70(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 108
LDI r2, 70
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
