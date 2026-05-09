; DESCRIPTION: Renders a black box of size 119x70 starting at (38, 141).
; PLAN: r0=38(x), r1=141(y), r2=119(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 141
LDI r2, 119
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
