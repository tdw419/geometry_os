; DESCRIPTION: Composite: Sets a single red pixel at (492, 56) then Creates a black rectangular region at (298, 175) spanning 45 by 46 pixels then Draws a white line from (437, 28) to (442, 112).
; PLAN: r0=492(x), r1=56(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=298(x), r6=175(y), r7=45(width), r8=46(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=437(x1), r11=28(y1), r12=442(x2), r13=112(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 492
LDI r1, 56
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 298
LDI r6, 175
LDI r7, 45
LDI r8, 46
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 437
LDI r11, 28
LDI r12, 442
LDI r13, 112
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
