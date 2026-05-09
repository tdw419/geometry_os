; DESCRIPTION: Composite: Renders a yellow line between points (255, 165) and (373, 139) then Places a black dot at position (460, 37).
; PLAN: r0=255(x1), r1=165(y1), r2=373(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=460(x), r6=37(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 165
LDI r2, 373
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 37
LDI r7, 0x000000
PSET r5, r6, r7
HALT
