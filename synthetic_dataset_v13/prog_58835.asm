; DESCRIPTION: Renders a green box of size 19x35 starting at (322, 209).
; PLAN: r0=322(x), r1=209(y), r2=19(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 209
LDI r2, 19
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
