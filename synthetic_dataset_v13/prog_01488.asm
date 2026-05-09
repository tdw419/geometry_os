; DESCRIPTION: Renders a purple box of size 54x99 starting at (187, 72).
; PLAN: r0=187(x), r1=72(y), r2=54(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 72
LDI r2, 54
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
