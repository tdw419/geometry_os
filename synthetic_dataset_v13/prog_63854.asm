; DESCRIPTION: Renders a blue box of size 44x53 starting at (70, 191).
; PLAN: r0=70(x), r1=191(y), r2=44(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 191
LDI r2, 44
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
