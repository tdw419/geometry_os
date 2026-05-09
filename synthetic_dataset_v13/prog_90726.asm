; DESCRIPTION: Composite: Places a red circle of radius 70 at center (160, 138) then Sets a single white pixel at (101, 242).
; PLAN: r0=160(x), r1=138(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x), r6=242(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 160
LDI r1, 138
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 242
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
