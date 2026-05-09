; DESCRIPTION: Composite: Places a white line segment connecting (344, 17) to (20, 155) then Places a black dot at position (176, 166).
; PLAN: r0=344(x1), r1=17(y1), r2=20(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=166(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 344
LDI r1, 17
LDI r2, 20
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 166
LDI r7, 0x000000
PSET r5, r6, r7
HALT
