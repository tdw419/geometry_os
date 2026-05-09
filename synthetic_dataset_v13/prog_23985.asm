; DESCRIPTION: Composite: Sets a single cyan pixel at (325, 48) then Renders a cyan line between points (121, 243) and (365, 157) then Places a green circle of radius 73 at center (385, 144).
; PLAN: r0=325(x), r1=48(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=121(x1), r6=243(y1), r7=365(x2), r8=157(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=385(x), r11=144(y), r12=73(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 325
LDI r1, 48
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 121
LDI r6, 243
LDI r7, 365
LDI r8, 157
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 144
LDI r12, 73
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
