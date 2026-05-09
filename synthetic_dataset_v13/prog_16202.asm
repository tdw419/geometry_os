; DESCRIPTION: Renders a purple box of size 12x33 starting at (44, 21).
; PLAN: r0=44(x), r1=21(y), r2=12(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 21
LDI r2, 12
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
