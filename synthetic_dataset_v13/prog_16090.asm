; DESCRIPTION: Renders a purple box of size 66x39 starting at (205, 186).
; PLAN: r0=205(x), r1=186(y), r2=66(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 186
LDI r2, 66
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
