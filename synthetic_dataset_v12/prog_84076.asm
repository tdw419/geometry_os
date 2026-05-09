; DESCRIPTION: Renders a yellow box of size 47x80 starting at (318, 15).
; PLAN: r0=318(x), r1=15(y), r2=47(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 15
LDI r2, 47
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
