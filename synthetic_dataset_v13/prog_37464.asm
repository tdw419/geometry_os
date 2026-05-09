; DESCRIPTION: Renders a yellow box of size 45x81 starting at (81, 68).
; PLAN: r0=81(x), r1=68(y), r2=45(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 68
LDI r2, 45
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
