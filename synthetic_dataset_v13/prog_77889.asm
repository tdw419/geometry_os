; DESCRIPTION: Composite: Creates a white rectangular region at (385, 197) spanning 63 by 10 pixels then Draws a white line from (417, 38) to (40, 225) then Sets a single black pixel at (227, 47).
; PLAN: r0=385(x), r1=197(y), r2=63(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=417(x1), r6=38(y1), r7=40(x2), r8=225(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=227(x), r11=47(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 385
LDI r1, 197
LDI r2, 63
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 38
LDI r7, 40
LDI r8, 225
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 47
LDI r12, 0x000000
PSET r10, r11, r12
HALT
