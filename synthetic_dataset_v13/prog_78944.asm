; DESCRIPTION: Renders a yellow box of size 104x107 starting at (376, 101).
; PLAN: r0=376(x), r1=101(y), r2=104(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 101
LDI r2, 104
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
