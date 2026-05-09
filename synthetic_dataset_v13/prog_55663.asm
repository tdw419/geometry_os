; DESCRIPTION: Renders a blue box of size 36x37 starting at (446, 193).
; PLAN: r0=446(x), r1=193(y), r2=36(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 193
LDI r2, 36
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
