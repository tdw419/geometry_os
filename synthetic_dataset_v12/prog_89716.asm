; DESCRIPTION: Creates a red circular shape at (174, 220) with radius 35.
; PLAN: r0=174(x), r1=220(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 220
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
