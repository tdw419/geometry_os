; DESCRIPTION: Composite: Places a cyan circle of radius 19 at center (440, 115) then Places a yellow dot at position (403, 31).
; PLAN: r0=440(x), r1=115(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x), r6=31(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 440
LDI r1, 115
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 31
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
