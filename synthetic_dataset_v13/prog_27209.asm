; DESCRIPTION: Creates a red circular shape at (146, 109) with radius 44.
; PLAN: r0=146(x), r1=109(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 109
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
