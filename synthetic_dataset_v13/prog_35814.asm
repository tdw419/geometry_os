; DESCRIPTION: Renders a yellow box of size 34x104 starting at (452, 46).
; PLAN: r0=452(x), r1=46(y), r2=34(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 46
LDI r2, 34
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
