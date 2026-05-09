; DESCRIPTION: Renders a black box of size 83x55 starting at (285, 149).
; PLAN: r0=285(x), r1=149(y), r2=83(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 149
LDI r2, 83
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
