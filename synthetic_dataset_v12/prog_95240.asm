; DESCRIPTION: Renders a blue box of size 17x103 starting at (120, 132).
; PLAN: r0=120(x), r1=132(y), r2=17(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 132
LDI r2, 17
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
