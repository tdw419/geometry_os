; DESCRIPTION: Renders a blue box of size 102x16 starting at (366, 185).
; PLAN: r0=366(x), r1=185(y), r2=102(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 185
LDI r2, 102
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
