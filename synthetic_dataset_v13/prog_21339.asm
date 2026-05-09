; DESCRIPTION: Draws a yellow circle centered at (187, 186) with radius 44.
; PLAN: r0=187(x), r1=186(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 186
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
