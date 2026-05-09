; DESCRIPTION: Renders a yellow box of size 44x43 starting at (415, 147).
; PLAN: r0=415(x), r1=147(y), r2=44(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 147
LDI r2, 44
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
