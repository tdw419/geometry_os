; DESCRIPTION: Renders a blue box of size 93x11 starting at (175, 221).
; PLAN: r0=175(x), r1=221(y), r2=93(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 221
LDI r2, 93
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
