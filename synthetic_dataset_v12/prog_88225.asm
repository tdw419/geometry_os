; DESCRIPTION: Renders a blue box of size 16x79 starting at (310, 82).
; PLAN: r0=310(x), r1=82(y), r2=16(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 82
LDI r2, 16
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
