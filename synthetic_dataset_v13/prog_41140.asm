; DESCRIPTION: Renders a yellow box of size 21x115 starting at (339, 141).
; PLAN: r0=339(x), r1=141(y), r2=21(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 141
LDI r2, 21
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
