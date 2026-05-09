; DESCRIPTION: Creates a red circular shape at (392, 77) with radius 58.
; PLAN: r0=392(x), r1=77(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 77
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
