; DESCRIPTION: Renders a yellow box of size 44x91 starting at (118, 130).
; PLAN: r0=118(x), r1=130(y), r2=44(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 130
LDI r2, 44
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
