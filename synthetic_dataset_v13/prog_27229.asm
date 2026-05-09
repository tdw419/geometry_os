; DESCRIPTION: Renders a purple box of size 15x73 starting at (186, 160).
; PLAN: r0=186(x), r1=160(y), r2=15(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 160
LDI r2, 15
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
