; DESCRIPTION: Renders a yellow box of size 71x112 starting at (402, 46).
; PLAN: r0=402(x), r1=46(y), r2=71(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 46
LDI r2, 71
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
