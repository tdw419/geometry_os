; DESCRIPTION: Renders a yellow box of size 11x49 starting at (174, 5).
; PLAN: r0=174(x), r1=5(y), r2=11(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 5
LDI r2, 11
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
