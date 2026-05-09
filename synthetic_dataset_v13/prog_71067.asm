; DESCRIPTION: Composite: Sets a single green pixel at (321, 144) then Renders a white line between points (385, 128) and (24, 86).
; PLAN: r0=321(x), r1=144(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=385(x1), r6=128(y1), r7=24(x2), r8=86(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 144
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 385
LDI r6, 128
LDI r7, 24
LDI r8, 86
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
