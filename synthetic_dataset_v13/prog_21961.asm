; DESCRIPTION: Renders a black box of size 110x16 starting at (397, 7).
; PLAN: r0=397(x), r1=7(y), r2=110(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 7
LDI r2, 110
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
