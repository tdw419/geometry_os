; DESCRIPTION: Renders a purple box of size 96x70 starting at (172, 7).
; PLAN: r0=172(x), r1=7(y), r2=96(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 7
LDI r2, 96
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
