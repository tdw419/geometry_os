; DESCRIPTION: Renders a blue box of size 104x76 starting at (149, 132).
; PLAN: r0=149(x), r1=132(y), r2=104(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 132
LDI r2, 104
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
