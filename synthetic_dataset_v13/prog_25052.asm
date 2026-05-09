; DESCRIPTION: Renders a blue box of size 36x44 starting at (301, 74).
; PLAN: r0=301(x), r1=74(y), r2=36(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 74
LDI r2, 36
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
