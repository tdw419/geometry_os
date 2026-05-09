; DESCRIPTION: Renders a magenta box of size 15x70 starting at (30, 31).
; PLAN: r0=30(x), r1=31(y), r2=15(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 31
LDI r2, 15
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
