; DESCRIPTION: Renders a magenta box of size 70x14 starting at (90, 234).
; PLAN: r0=90(x), r1=234(y), r2=70(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 234
LDI r2, 70
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
