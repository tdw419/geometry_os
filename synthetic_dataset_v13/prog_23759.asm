; DESCRIPTION: Renders a purple box of size 74x72 starting at (243, 38).
; PLAN: r0=243(x), r1=38(y), r2=74(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 38
LDI r2, 74
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
