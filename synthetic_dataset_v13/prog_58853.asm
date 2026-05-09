; DESCRIPTION: Renders a purple box of size 23x99 starting at (212, 7).
; PLAN: r0=212(x), r1=7(y), r2=23(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 7
LDI r2, 23
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
