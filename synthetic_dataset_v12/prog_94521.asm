; DESCRIPTION: Composite: Sets a single cyan pixel at (468, 116) then Renders a cyan disk with center (215, 91) and radius 80.
; PLAN: r0=468(x), r1=116(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=215(x), r6=91(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 468
LDI r1, 116
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 215
LDI r6, 91
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
