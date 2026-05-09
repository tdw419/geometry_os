; DESCRIPTION: Composite: Sets a single green pixel at (318, 122) then Renders a cyan line between points (261, 221) and (219, 242).
; PLAN: r0=318(x), r1=122(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=261(x1), r6=221(y1), r7=219(x2), r8=242(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 122
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 261
LDI r6, 221
LDI r7, 219
LDI r8, 242
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
