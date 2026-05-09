; DESCRIPTION: Renders a blue box of size 109x80 starting at (197, 44).
; PLAN: r0=197(x), r1=44(y), r2=109(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 44
LDI r2, 109
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
