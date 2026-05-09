; DESCRIPTION: Draws a cyan circle centered at (145, 168) with radius 65.
; PLAN: r0=145(x), r1=168(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 168
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
