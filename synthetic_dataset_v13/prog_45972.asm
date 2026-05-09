; DESCRIPTION: Renders a purple box of size 39x99 starting at (107, 46).
; PLAN: r0=107(x), r1=46(y), r2=39(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 46
LDI r2, 39
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
