; DESCRIPTION: Composite: Places a orange circle of radius 61 at center (379, 129) then Sets a single red pixel at (446, 30).
; PLAN: r0=379(x), r1=129(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=30(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 129
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 30
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
