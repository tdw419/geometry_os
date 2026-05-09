; DESCRIPTION: Composite: Sets a single cyan pixel at (403, 78) then Places a white circle of radius 22 at center (298, 73).
; PLAN: r0=403(x), r1=78(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=298(x), r6=73(y), r7=22(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 403
LDI r1, 78
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 298
LDI r6, 73
LDI r7, 22
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
