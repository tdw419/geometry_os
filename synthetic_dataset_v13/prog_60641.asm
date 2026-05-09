; DESCRIPTION: Composite: Sets a single cyan pixel at (174, 135) then Places a cyan circle of radius 75 at center (384, 152).
; PLAN: r0=174(x), r1=135(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=384(x), r6=152(y), r7=75(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 174
LDI r1, 135
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 384
LDI r6, 152
LDI r7, 75
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
