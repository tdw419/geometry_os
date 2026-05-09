; DESCRIPTION: Renders a black box of size 37x10 starting at (240, 145).
; PLAN: r0=240(x), r1=145(y), r2=37(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 145
LDI r2, 37
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
