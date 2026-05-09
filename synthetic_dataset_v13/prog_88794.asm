; DESCRIPTION: Renders a yellow box of size 44x54 starting at (355, 2).
; PLAN: r0=355(x), r1=2(y), r2=44(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 2
LDI r2, 44
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
