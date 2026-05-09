; DESCRIPTION: Renders a purple box of size 47x107 starting at (444, 14).
; PLAN: r0=444(x), r1=14(y), r2=47(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 14
LDI r2, 47
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
