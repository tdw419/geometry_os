; DESCRIPTION: Renders a blue box of size 52x71 starting at (192, 120).
; PLAN: r0=192(x), r1=120(y), r2=52(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 120
LDI r2, 52
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
