; DESCRIPTION: Draws a green circle centered at (468, 186) with radius 11.
; PLAN: r0=468(x), r1=186(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 186
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
