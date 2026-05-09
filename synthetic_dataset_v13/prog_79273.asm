; DESCRIPTION: Renders a purple box of size 119x63 starting at (59, 7).
; PLAN: r0=59(x), r1=7(y), r2=119(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 7
LDI r2, 119
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
