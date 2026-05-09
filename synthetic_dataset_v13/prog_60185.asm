; DESCRIPTION: Renders a yellow box of size 45x103 starting at (29, 28).
; PLAN: r0=29(x), r1=28(y), r2=45(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 28
LDI r2, 45
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
