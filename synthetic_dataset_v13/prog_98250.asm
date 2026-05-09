; DESCRIPTION: Composite: Creates a white circular shape at (216, 79) with radius 61 then Renders a cyan line between points (358, 203) and (267, 83) then Sets a single green pixel at (358, 61).
; PLAN: r0=216(x), r1=79(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x1), r6=203(y1), r7=267(x2), r8=83(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=358(x), r11=61(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 216
LDI r1, 79
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 203
LDI r7, 267
LDI r8, 83
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 61
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
