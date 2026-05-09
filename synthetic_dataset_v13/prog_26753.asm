; DESCRIPTION: Renders a blue box of size 15x61 starting at (230, 193).
; PLAN: r0=230(x), r1=193(y), r2=15(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 193
LDI r2, 15
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
