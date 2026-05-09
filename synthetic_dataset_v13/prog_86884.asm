; DESCRIPTION: Renders a yellow box of size 47x15 starting at (100, 76).
; PLAN: r0=100(x), r1=76(y), r2=47(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 76
LDI r2, 47
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
