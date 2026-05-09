; DESCRIPTION: Renders a black box of size 85x40 starting at (321, 64).
; PLAN: r0=321(x), r1=64(y), r2=85(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 64
LDI r2, 85
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
