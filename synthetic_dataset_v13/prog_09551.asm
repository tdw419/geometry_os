; DESCRIPTION: Renders a blue box of size 54x48 starting at (310, 127).
; PLAN: r0=310(x), r1=127(y), r2=54(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 127
LDI r2, 54
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
