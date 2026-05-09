; DESCRIPTION: Renders a purple box of size 110x59 starting at (338, 37).
; PLAN: r0=338(x), r1=37(y), r2=110(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 37
LDI r2, 110
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
