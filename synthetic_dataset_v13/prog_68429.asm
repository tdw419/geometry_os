; DESCRIPTION: Creates a red circular shape at (186, 94) with radius 55.
; PLAN: r0=186(x), r1=94(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 94
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
