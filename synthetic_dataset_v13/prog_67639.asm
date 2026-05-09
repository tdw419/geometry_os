; DESCRIPTION: Composite: Places a white circle of radius 31 at center (398, 200) then Places a green dot at position (379, 218).
; PLAN: r0=398(x), r1=200(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=218(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 398
LDI r1, 200
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 218
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
