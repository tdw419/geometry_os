; DESCRIPTION: Draws a cyan circle centered at (188, 168) with radius 66.
; PLAN: r0=188(x), r1=168(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 168
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
