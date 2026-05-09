; DESCRIPTION: Renders a yellow box of size 44x46 starting at (379, 167).
; PLAN: r0=379(x), r1=167(y), r2=44(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 167
LDI r2, 44
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
