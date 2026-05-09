; DESCRIPTION: Renders a yellow box of size 95x10 starting at (274, 222).
; PLAN: r0=274(x), r1=222(y), r2=95(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 222
LDI r2, 95
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
