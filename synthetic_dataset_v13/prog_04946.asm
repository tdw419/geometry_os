; DESCRIPTION: Renders a purple box of size 59x115 starting at (261, 20).
; PLAN: r0=261(x), r1=20(y), r2=59(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 20
LDI r2, 59
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
