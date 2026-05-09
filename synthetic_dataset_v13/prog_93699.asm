; DESCRIPTION: Renders a purple box of size 47x33 starting at (241, 138).
; PLAN: r0=241(x), r1=138(y), r2=47(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 138
LDI r2, 47
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
