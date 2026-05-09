; DESCRIPTION: Renders a yellow box of size 37x102 starting at (339, 104).
; PLAN: r0=339(x), r1=104(y), r2=37(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 104
LDI r2, 37
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
