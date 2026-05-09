; DESCRIPTION: Renders a blue box of size 24x102 starting at (180, 36).
; PLAN: r0=180(x), r1=36(y), r2=24(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 36
LDI r2, 24
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
