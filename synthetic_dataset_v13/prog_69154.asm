; DESCRIPTION: Draws a red circle centered at (470, 58) with radius 25.
; PLAN: r0=470(x), r1=58(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 58
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
