; DESCRIPTION: Renders a yellow box of size 58x68 starting at (95, 19).
; PLAN: r0=95(x), r1=19(y), r2=58(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 19
LDI r2, 58
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
