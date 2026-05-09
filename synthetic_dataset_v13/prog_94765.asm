; DESCRIPTION: Renders a purple box of size 89x19 starting at (368, 55).
; PLAN: r0=368(x), r1=55(y), r2=89(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 55
LDI r2, 89
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
