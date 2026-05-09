; DESCRIPTION: Renders a purple box of size 34x66 starting at (59, 129).
; PLAN: r0=59(x), r1=129(y), r2=34(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 129
LDI r2, 34
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
