; DESCRIPTION: Renders a yellow box of size 72x14 starting at (117, 55).
; PLAN: r0=117(x), r1=55(y), r2=72(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 55
LDI r2, 72
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
