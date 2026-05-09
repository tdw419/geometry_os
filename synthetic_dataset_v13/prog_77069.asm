; DESCRIPTION: Renders a yellow box of size 19x88 starting at (467, 21).
; PLAN: r0=467(x), r1=21(y), r2=19(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 21
LDI r2, 19
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
