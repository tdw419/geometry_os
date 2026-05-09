; DESCRIPTION: Composite: Places a black circle of radius 34 at center (320, 106) then Draws a white line from (286, 111) to (168, 15) then Sets a single yellow pixel at (116, 30).
; PLAN: r0=320(x), r1=106(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x1), r6=111(y1), r7=168(x2), r8=15(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=116(x), r11=30(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 320
LDI r1, 106
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 111
LDI r7, 168
LDI r8, 15
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 116
LDI r11, 30
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
