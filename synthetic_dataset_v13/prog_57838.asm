; DESCRIPTION: Renders a yellow box of size 18x53 starting at (318, 188).
; PLAN: r0=318(x), r1=188(y), r2=18(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 188
LDI r2, 18
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
