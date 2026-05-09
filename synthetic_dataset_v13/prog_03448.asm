; DESCRIPTION: Draws a yellow circle centered at (180, 117) with radius 77.
; PLAN: r0=180(x), r1=117(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 117
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
