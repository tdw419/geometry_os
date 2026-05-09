; DESCRIPTION: Draws a red circle centered at (174, 180) with radius 56.
; PLAN: r0=174(x), r1=180(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 180
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
