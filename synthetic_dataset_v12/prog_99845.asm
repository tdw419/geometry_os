; DESCRIPTION: Renders a purple box of size 94x75 starting at (144, 24).
; PLAN: r0=144(x), r1=24(y), r2=94(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 24
LDI r2, 94
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
