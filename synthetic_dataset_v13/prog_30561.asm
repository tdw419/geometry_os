; DESCRIPTION: Renders a yellow box of size 94x14 starting at (114, 70).
; PLAN: r0=114(x), r1=70(y), r2=94(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 70
LDI r2, 94
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
