; DESCRIPTION: Renders a magenta box of size 89x72 starting at (418, 70).
; PLAN: r0=418(x), r1=70(y), r2=89(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 70
LDI r2, 89
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
