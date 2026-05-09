; DESCRIPTION: Renders a yellow box of size 62x18 starting at (236, 124).
; PLAN: r0=236(x), r1=124(y), r2=62(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 124
LDI r2, 62
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
