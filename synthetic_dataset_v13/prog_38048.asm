; DESCRIPTION: Renders a purple box of size 56x55 starting at (261, 29).
; PLAN: r0=261(x), r1=29(y), r2=56(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 29
LDI r2, 56
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
