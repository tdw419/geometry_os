; DESCRIPTION: Renders a yellow box of size 65x104 starting at (72, 46).
; PLAN: r0=72(x), r1=46(y), r2=65(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 46
LDI r2, 65
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
