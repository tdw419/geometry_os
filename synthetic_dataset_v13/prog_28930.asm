; DESCRIPTION: Composite: Sets a single white pixel at (352, 149) then Renders a cyan disk with center (38, 160) and radius 29.
; PLAN: r0=352(x), r1=149(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=38(x), r6=160(y), r7=29(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 352
LDI r1, 149
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 38
LDI r6, 160
LDI r7, 29
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
