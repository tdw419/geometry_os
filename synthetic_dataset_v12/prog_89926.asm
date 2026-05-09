; DESCRIPTION: Places a red circle of radius 22 at center (311, 174).
; PLAN: r0=311(x), r1=174(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 174
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
