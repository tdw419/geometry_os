; DESCRIPTION: Renders a black box of size 89x37 starting at (313, 48).
; PLAN: r0=313(x), r1=48(y), r2=89(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 48
LDI r2, 89
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
