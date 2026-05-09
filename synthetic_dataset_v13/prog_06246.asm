; DESCRIPTION: Renders a blue box of size 75x91 starting at (140, 37).
; PLAN: r0=140(x), r1=37(y), r2=75(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 37
LDI r2, 75
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
