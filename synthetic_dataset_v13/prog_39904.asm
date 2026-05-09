; DESCRIPTION: Composite: Places a blue dot at position (130, 154) then Places a red 44x60 rectangle at position (251, 31) then Draws a black line from (43, 45) to (364, 182).
; PLAN: r0=130(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=31(y), r7=44(width), r8=60(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=43(x1), r11=45(y1), r12=364(x2), r13=182(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 130
LDI r1, 154
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 251
LDI r6, 31
LDI r7, 44
LDI r8, 60
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 43
LDI r11, 45
LDI r12, 364
LDI r13, 182
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
