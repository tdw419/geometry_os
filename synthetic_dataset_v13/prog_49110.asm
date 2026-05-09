; DESCRIPTION: Draws a cyan circle centered at (133, 177) with radius 59.
; PLAN: r0=133(x), r1=177(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 177
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
