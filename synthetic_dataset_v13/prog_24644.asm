; DESCRIPTION: Composite: Sets a single black pixel at (470, 39) then Draws a purple rectangle at (470, 35) with width 18 and height 63 then Places a black line segment connecting (275, 141) to (72, 86).
; PLAN: r0=470(x), r1=39(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=470(x), r6=35(y), r7=18(width), r8=63(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=275(x1), r11=141(y1), r12=72(x2), r13=86(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 470
LDI r1, 39
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 470
LDI r6, 35
LDI r7, 18
LDI r8, 63
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 141
LDI r12, 72
LDI r13, 86
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
