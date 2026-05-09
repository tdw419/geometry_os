; DESCRIPTION: Renders a blue box of size 120x71 starting at (222, 127).
; PLAN: r0=222(x), r1=127(y), r2=120(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 127
LDI r2, 120
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
