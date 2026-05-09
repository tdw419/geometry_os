; DESCRIPTION: Creates a red circular shape at (242, 134) with radius 65.
; PLAN: r0=242(x), r1=134(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 134
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
