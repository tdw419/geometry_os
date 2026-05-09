; DESCRIPTION: Renders a purple box of size 117x120 starting at (271, 39).
; PLAN: r0=271(x), r1=39(y), r2=117(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 39
LDI r2, 117
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
