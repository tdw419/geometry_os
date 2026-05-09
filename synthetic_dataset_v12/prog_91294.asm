; DESCRIPTION: Renders a yellow box of size 110x50 starting at (140, 11).
; PLAN: r0=140(x), r1=11(y), r2=110(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 11
LDI r2, 110
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
