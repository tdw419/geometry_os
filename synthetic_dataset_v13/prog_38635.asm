; DESCRIPTION: Renders a magenta box of size 70x15 starting at (120, 131).
; PLAN: r0=120(x), r1=131(y), r2=70(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 131
LDI r2, 70
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
