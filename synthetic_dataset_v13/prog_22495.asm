; DESCRIPTION: Renders a purple box of size 23x56 starting at (302, 28).
; PLAN: r0=302(x), r1=28(y), r2=23(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 28
LDI r2, 23
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
