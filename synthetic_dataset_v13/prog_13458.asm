; DESCRIPTION: Draws a red circle centered at (411, 164) with radius 70.
; PLAN: r0=411(x), r1=164(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 164
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
