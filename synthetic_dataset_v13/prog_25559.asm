; DESCRIPTION: Composite: Creates a red circular shape at (403, 91) with radius 13 then Sets a single cyan pixel at (141, 150).
; PLAN: r0=403(x), r1=91(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=150(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 403
LDI r1, 91
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 150
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
