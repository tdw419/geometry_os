; DESCRIPTION: Composite: Draws a white line from (486, 136) to (465, 58) then Renders a yellow box of size 31x14 starting at (202, 66) then Places a yellow dot at position (273, 41).
; PLAN: r0=486(x1), r1=136(y1), r2=465(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=66(y), r7=31(width), r8=14(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=273(x), r11=41(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 486
LDI r1, 136
LDI r2, 465
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 66
LDI r7, 31
LDI r8, 14
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 41
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
