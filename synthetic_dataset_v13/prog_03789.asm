; DESCRIPTION: Composite: Creates a red circular shape at (436, 161) with radius 57 then Sets a single cyan pixel at (510, 217).
; PLAN: r0=436(x), r1=161(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=510(x), r6=217(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 436
LDI r1, 161
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 510
LDI r6, 217
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
