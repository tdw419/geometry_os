; DESCRIPTION: Composite: Sets a single black pixel at (491, 78) then Renders a white line between points (407, 147) and (298, 180) then Renders a yellow box of size 71x55 starting at (110, 135).
; PLAN: r0=491(x), r1=78(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=407(x1), r6=147(y1), r7=298(x2), r8=180(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=110(x), r11=135(y), r12=71(width), r13=55(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 491
LDI r1, 78
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 407
LDI r6, 147
LDI r7, 298
LDI r8, 180
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 135
LDI r12, 71
LDI r13, 55
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
