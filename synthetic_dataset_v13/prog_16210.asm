; DESCRIPTION: Renders a blue box of size 18x65 starting at (386, 17).
; PLAN: r0=386(x), r1=17(y), r2=18(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 17
LDI r2, 18
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
