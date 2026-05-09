; DESCRIPTION: Composite: Sets a single green pixel at (421, 129) then Draws a black rectangle at (41, 99) with width 47 and height 110 then Draws a black line from (373, 207) to (325, 215).
; PLAN: r0=421(x), r1=129(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=41(x), r6=99(y), r7=47(width), r8=110(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=373(x1), r11=207(y1), r12=325(x2), r13=215(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 129
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 41
LDI r6, 99
LDI r7, 47
LDI r8, 110
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 207
LDI r12, 325
LDI r13, 215
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
