; DESCRIPTION: Renders a yellow box of size 92x57 starting at (332, 9).
; PLAN: r0=332(x), r1=9(y), r2=92(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 9
LDI r2, 92
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
