; DESCRIPTION: Renders a yellow box of size 91x43 starting at (109, 202).
; PLAN: r0=109(x), r1=202(y), r2=91(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 202
LDI r2, 91
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
