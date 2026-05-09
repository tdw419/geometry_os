; DESCRIPTION: Renders a purple box of size 86x65 starting at (185, 18).
; PLAN: r0=185(x), r1=18(y), r2=86(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 18
LDI r2, 86
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
