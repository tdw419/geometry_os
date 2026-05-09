; DESCRIPTION: Composite: Renders a white disk with center (244, 190) and radius 39 then Places a blue line segment connecting (425, 221) to (363, 71) then Places a magenta dot at position (417, 94).
; PLAN: r0=244(x), r1=190(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x1), r6=221(y1), r7=363(x2), r8=71(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=417(x), r11=94(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 190
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 221
LDI r7, 363
LDI r8, 71
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 94
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
