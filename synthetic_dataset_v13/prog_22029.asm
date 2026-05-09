; DESCRIPTION: Renders a yellow box of size 66x71 starting at (313, 47).
; PLAN: r0=313(x), r1=47(y), r2=66(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 47
LDI r2, 66
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
