; DESCRIPTION: Composite: Creates a red circular shape at (275, 118) with radius 55 then Places a blue dot at position (465, 70).
; PLAN: r0=275(x), r1=118(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x), r6=70(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 275
LDI r1, 118
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 70
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
