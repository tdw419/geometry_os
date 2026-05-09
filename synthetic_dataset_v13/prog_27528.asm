; DESCRIPTION: Renders a blue box of size 39x76 starting at (3, 160).
; PLAN: r0=3(x), r1=160(y), r2=39(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 160
LDI r2, 39
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
