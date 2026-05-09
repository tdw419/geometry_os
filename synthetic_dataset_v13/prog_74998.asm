; DESCRIPTION: Renders a purple box of size 35x44 starting at (186, 47).
; PLAN: r0=186(x), r1=47(y), r2=35(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 47
LDI r2, 35
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
