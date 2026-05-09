; DESCRIPTION: Composite: Places a green dot at position (403, 184) then Places a yellow circle of radius 55 at center (75, 77).
; PLAN: r0=403(x), r1=184(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=75(x), r6=77(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 403
LDI r1, 184
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 75
LDI r6, 77
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
