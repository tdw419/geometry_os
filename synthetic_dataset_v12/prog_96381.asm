; DESCRIPTION: Renders a yellow box of size 31x59 starting at (9, 18).
; PLAN: r0=9(x), r1=18(y), r2=31(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 18
LDI r2, 31
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
