; DESCRIPTION: Renders a purple box of size 22x83 starting at (394, 119).
; PLAN: r0=394(x), r1=119(y), r2=22(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 119
LDI r2, 22
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
