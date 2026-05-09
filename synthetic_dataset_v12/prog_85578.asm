; DESCRIPTION: Renders a blue box of size 70x40 starting at (376, 208).
; PLAN: r0=376(x), r1=208(y), r2=70(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 208
LDI r2, 70
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
