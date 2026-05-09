; DESCRIPTION: Renders a yellow box of size 20x55 starting at (336, 60).
; PLAN: r0=336(x), r1=60(y), r2=20(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 60
LDI r2, 20
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
