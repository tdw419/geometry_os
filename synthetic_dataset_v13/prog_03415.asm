; DESCRIPTION: Renders a yellow box of size 91x40 starting at (40, 83).
; PLAN: r0=40(x), r1=83(y), r2=91(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 83
LDI r2, 91
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
