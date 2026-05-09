; DESCRIPTION: Renders a black box of size 33x34 starting at (459, 37).
; PLAN: r0=459(x), r1=37(y), r2=33(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 37
LDI r2, 33
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
