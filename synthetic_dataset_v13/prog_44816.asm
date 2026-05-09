; DESCRIPTION: Composite: Renders a white line between points (460, 39) and (378, 149) then Creates a cyan circular shape at (140, 24) with radius 21.
; PLAN: r0=460(x1), r1=39(y1), r2=378(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=24(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 460
LDI r1, 39
LDI r2, 378
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 24
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
