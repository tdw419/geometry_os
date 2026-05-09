; DESCRIPTION: Composite: Places a cyan dot at position (357, 115) then Draws a green rectangle at (313, 85) with width 38 and height 10 then Draws a green line from (378, 107) to (145, 227).
; PLAN: r0=357(x), r1=115(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=313(x), r6=85(y), r7=38(width), r8=10(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=378(x1), r11=107(y1), r12=145(x2), r13=227(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 115
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 313
LDI r6, 85
LDI r7, 38
LDI r8, 10
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 107
LDI r12, 145
LDI r13, 227
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
