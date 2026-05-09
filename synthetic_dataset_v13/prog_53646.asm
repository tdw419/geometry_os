; DESCRIPTION: Renders a yellow box of size 21x40 starting at (381, 137).
; PLAN: r0=381(x), r1=137(y), r2=21(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 137
LDI r2, 21
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
