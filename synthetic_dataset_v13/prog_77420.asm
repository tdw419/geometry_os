; DESCRIPTION: Renders a blue box of size 102x14 starting at (362, 6).
; PLAN: r0=362(x), r1=6(y), r2=102(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 6
LDI r2, 102
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
