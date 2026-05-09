; DESCRIPTION: Renders a purple box of size 23x95 starting at (373, 80).
; PLAN: r0=373(x), r1=80(y), r2=23(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 80
LDI r2, 23
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
