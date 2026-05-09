; DESCRIPTION: Renders a blue box of size 75x103 starting at (195, 99).
; PLAN: r0=195(x), r1=99(y), r2=75(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 99
LDI r2, 75
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
