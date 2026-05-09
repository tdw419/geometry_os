; DESCRIPTION: Renders a yellow box of size 54x37 starting at (174, 78).
; PLAN: r0=174(x), r1=78(y), r2=54(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 78
LDI r2, 54
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
