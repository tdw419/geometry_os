; DESCRIPTION: Renders a purple box of size 80x13 starting at (425, 199).
; PLAN: r0=425(x), r1=199(y), r2=80(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 199
LDI r2, 80
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
