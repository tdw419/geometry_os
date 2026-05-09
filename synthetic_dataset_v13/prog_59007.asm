; DESCRIPTION: Renders a yellow box of size 22x45 starting at (59, 114).
; PLAN: r0=59(x), r1=114(y), r2=22(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 114
LDI r2, 22
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
