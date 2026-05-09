; DESCRIPTION: Renders a yellow box of size 17x31 starting at (465, 24).
; PLAN: r0=465(x), r1=24(y), r2=17(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 24
LDI r2, 17
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
