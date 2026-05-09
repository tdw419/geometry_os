; DESCRIPTION: Composite: Renders a white line between points (17, 151) and (113, 141) then Sets a single green pixel at (358, 49).
; PLAN: r0=17(x1), r1=151(y1), r2=113(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=49(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 17
LDI r1, 151
LDI r2, 113
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 49
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
