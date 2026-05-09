; DESCRIPTION: Draws a cyan circle centered at (169, 95) with radius 52.
; PLAN: r0=169(x), r1=95(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 95
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
