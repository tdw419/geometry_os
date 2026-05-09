; DESCRIPTION: Composite: Sets a single cyan pixel at (439, 37) then Renders a white line between points (271, 115) and (24, 238).
; PLAN: r0=439(x), r1=37(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=271(x1), r6=115(y1), r7=24(x2), r8=238(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 37
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 271
LDI r6, 115
LDI r7, 24
LDI r8, 238
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
