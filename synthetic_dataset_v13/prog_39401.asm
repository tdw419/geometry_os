; DESCRIPTION: Draws a cyan circle centered at (112, 133) with radius 80.
; PLAN: r0=112(x), r1=133(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 133
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
