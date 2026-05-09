; DESCRIPTION: Renders a yellow box of size 104x104 starting at (158, 82).
; PLAN: r0=158(x), r1=82(y), r2=104(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 82
LDI r2, 104
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
