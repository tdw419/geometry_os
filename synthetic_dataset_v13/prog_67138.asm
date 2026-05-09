; DESCRIPTION: Renders a green box of size 120x40 starting at (322, 110).
; PLAN: r0=322(x), r1=110(y), r2=120(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 110
LDI r2, 120
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
