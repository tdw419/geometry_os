; DESCRIPTION: Renders a black box of size 31x28 starting at (175, 80).
; PLAN: r0=175(x), r1=80(y), r2=31(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 80
LDI r2, 31
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
