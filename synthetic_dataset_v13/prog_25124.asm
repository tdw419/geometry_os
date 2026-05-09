; DESCRIPTION: Renders a purple box of size 96x32 starting at (13, 7).
; PLAN: r0=13(x), r1=7(y), r2=96(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 7
LDI r2, 96
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
