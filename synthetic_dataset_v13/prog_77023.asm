; DESCRIPTION: Draws a cyan circle centered at (368, 95) with radius 69.
; PLAN: r0=368(x), r1=95(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 95
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
