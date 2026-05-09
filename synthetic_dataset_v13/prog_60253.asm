; DESCRIPTION: Renders a blue box of size 46x82 starting at (390, 164).
; PLAN: r0=390(x), r1=164(y), r2=46(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 164
LDI r2, 46
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
