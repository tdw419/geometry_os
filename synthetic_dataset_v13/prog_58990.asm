; DESCRIPTION: Renders a purple box of size 34x38 starting at (213, 17).
; PLAN: r0=213(x), r1=17(y), r2=34(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 17
LDI r2, 34
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
