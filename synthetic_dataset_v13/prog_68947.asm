; DESCRIPTION: Renders a yellow box of size 104x88 starting at (242, 81).
; PLAN: r0=242(x), r1=81(y), r2=104(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 81
LDI r2, 104
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
