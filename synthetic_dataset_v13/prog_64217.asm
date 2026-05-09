; DESCRIPTION: Renders a black box of size 97x55 starting at (289, 86).
; PLAN: r0=289(x), r1=86(y), r2=97(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 86
LDI r2, 97
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
