; DESCRIPTION: Renders a yellow box of size 62x110 starting at (375, 82).
; PLAN: r0=375(x), r1=82(y), r2=62(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 82
LDI r2, 62
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
