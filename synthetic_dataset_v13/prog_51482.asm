; DESCRIPTION: Renders a purple box of size 80x34 starting at (70, 142).
; PLAN: r0=70(x), r1=142(y), r2=80(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 142
LDI r2, 80
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
