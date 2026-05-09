; DESCRIPTION: Renders a purple box of size 33x71 starting at (375, 168).
; PLAN: r0=375(x), r1=168(y), r2=33(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 168
LDI r2, 33
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
