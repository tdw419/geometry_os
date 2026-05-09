; DESCRIPTION: Renders a purple box of size 62x16 starting at (185, 161).
; PLAN: r0=185(x), r1=161(y), r2=62(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 161
LDI r2, 62
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
