; DESCRIPTION: Renders a yellow box of size 58x112 starting at (178, 77).
; PLAN: r0=178(x), r1=77(y), r2=58(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 77
LDI r2, 58
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
