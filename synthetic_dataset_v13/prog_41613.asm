; DESCRIPTION: Composite: Creates a blue circular shape at (394, 202) with radius 18 then Draws a white line from (364, 105) to (207, 192) then Places a yellow dot at position (250, 177).
; PLAN: r0=394(x), r1=202(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=364(x1), r6=105(y1), r7=207(x2), r8=192(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=250(x), r11=177(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 394
LDI r1, 202
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 364
LDI r6, 105
LDI r7, 207
LDI r8, 192
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 177
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
