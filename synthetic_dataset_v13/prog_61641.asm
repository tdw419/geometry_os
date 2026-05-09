; DESCRIPTION: Renders a purple box of size 37x21 starting at (259, 66).
; PLAN: r0=259(x), r1=66(y), r2=37(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 66
LDI r2, 37
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
