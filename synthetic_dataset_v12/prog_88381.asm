; DESCRIPTION: Renders a purple box of size 114x80 starting at (171, 20).
; PLAN: r0=171(x), r1=20(y), r2=114(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 20
LDI r2, 114
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
