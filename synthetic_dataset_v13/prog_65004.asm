; DESCRIPTION: Renders a yellow box of size 109x45 starting at (40, 95).
; PLAN: r0=40(x), r1=95(y), r2=109(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 95
LDI r2, 109
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
