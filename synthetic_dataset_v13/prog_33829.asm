; DESCRIPTION: Creates a red circular shape at (236, 146) with radius 75.
; PLAN: r0=236(x), r1=146(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 146
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
