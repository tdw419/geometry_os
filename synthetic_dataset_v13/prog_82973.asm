; DESCRIPTION: Renders a black box of size 86x111 starting at (357, 0).
; PLAN: r0=357(x), r1=0(y), r2=86(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 0
LDI r2, 86
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
