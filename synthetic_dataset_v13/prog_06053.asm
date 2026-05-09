; DESCRIPTION: Renders a blue box of size 48x24 starting at (429, 80).
; PLAN: r0=429(x), r1=80(y), r2=48(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 80
LDI r2, 48
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
