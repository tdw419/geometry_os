; DESCRIPTION: Composite: Creates a red circular shape at (116, 169) with radius 16 then Sets a single magenta pixel at (306, 244).
; PLAN: r0=116(x), r1=169(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x), r6=244(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 116
LDI r1, 169
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 244
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
