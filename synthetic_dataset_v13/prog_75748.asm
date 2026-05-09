; DESCRIPTION: Renders a blue box of size 82x74 starting at (20, 153).
; PLAN: r0=20(x), r1=153(y), r2=82(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 153
LDI r2, 82
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
