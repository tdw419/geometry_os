; DESCRIPTION: Renders a black box of size 77x111 starting at (152, 97).
; PLAN: r0=152(x), r1=97(y), r2=77(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 97
LDI r2, 77
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
