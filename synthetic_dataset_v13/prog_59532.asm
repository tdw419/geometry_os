; DESCRIPTION: Renders a yellow box of size 109x27 starting at (55, 104).
; PLAN: r0=55(x), r1=104(y), r2=109(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 104
LDI r2, 109
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
