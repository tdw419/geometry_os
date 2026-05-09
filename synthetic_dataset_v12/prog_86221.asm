; DESCRIPTION: Renders a black box of size 45x111 starting at (321, 7).
; PLAN: r0=321(x), r1=7(y), r2=45(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 7
LDI r2, 45
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
