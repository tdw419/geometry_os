; DESCRIPTION: Renders a black box of size 75x99 starting at (274, 128).
; PLAN: r0=274(x), r1=128(y), r2=75(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 128
LDI r2, 75
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
