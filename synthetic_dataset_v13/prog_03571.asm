; DESCRIPTION: Renders a black box of size 38x17 starting at (244, 188).
; PLAN: r0=244(x), r1=188(y), r2=38(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 188
LDI r2, 38
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
