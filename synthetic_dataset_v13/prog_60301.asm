; DESCRIPTION: Renders a yellow box of size 85x11 starting at (336, 206).
; PLAN: r0=336(x), r1=206(y), r2=85(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 206
LDI r2, 85
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
