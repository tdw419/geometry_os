; DESCRIPTION: Creates a red circular shape at (470, 138) with radius 13.
; PLAN: r0=470(x), r1=138(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 138
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
