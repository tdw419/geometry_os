; DESCRIPTION: Composite: Creates a red circular shape at (216, 152) with radius 60 then Places a orange dot at position (425, 117).
; PLAN: r0=216(x), r1=152(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x), r6=117(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 216
LDI r1, 152
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 117
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
