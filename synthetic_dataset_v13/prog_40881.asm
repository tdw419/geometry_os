; DESCRIPTION: Renders a yellow box of size 34x91 starting at (91, 112).
; PLAN: r0=91(x), r1=112(y), r2=34(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 112
LDI r2, 34
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
