; DESCRIPTION: Renders a blue box of size 18x17 starting at (446, 197).
; PLAN: r0=446(x), r1=197(y), r2=18(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 197
LDI r2, 18
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
