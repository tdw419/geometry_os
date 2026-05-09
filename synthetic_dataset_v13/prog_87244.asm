; DESCRIPTION: Renders a black box of size 77x34 starting at (347, 221).
; PLAN: r0=347(x), r1=221(y), r2=77(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 221
LDI r2, 77
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
