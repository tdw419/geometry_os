; DESCRIPTION: Renders a yellow box of size 11x101 starting at (487, 104).
; PLAN: r0=487(x), r1=104(y), r2=11(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 104
LDI r2, 11
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
