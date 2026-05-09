; DESCRIPTION: Renders a yellow box of size 70x21 starting at (45, 84).
; PLAN: r0=45(x), r1=84(y), r2=70(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 84
LDI r2, 70
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
