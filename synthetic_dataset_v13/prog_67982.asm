; DESCRIPTION: Renders a purple box of size 103x34 starting at (181, 46).
; PLAN: r0=181(x), r1=46(y), r2=103(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 46
LDI r2, 103
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
