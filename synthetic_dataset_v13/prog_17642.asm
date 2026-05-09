; DESCRIPTION: Renders a yellow box of size 37x28 starting at (104, 14).
; PLAN: r0=104(x), r1=14(y), r2=37(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 14
LDI r2, 37
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
