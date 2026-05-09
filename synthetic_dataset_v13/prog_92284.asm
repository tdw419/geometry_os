; DESCRIPTION: Draws a yellow circle centered at (207, 95) with radius 70.
; PLAN: r0=207(x), r1=95(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 95
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
