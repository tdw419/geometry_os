; DESCRIPTION: Renders a blue box of size 60x71 starting at (281, 153).
; PLAN: r0=281(x), r1=153(y), r2=60(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 153
LDI r2, 60
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
