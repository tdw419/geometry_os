; DESCRIPTION: Composite: Draws a black rectangle at (274, 20) with width 46 and height 13 then Renders a black line between points (102, 17) and (275, 229) then Places a purple dot at position (69, 126).
; PLAN: r0=274(x), r1=20(y), r2=46(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x1), r6=17(y1), r7=275(x2), r8=229(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=69(x), r11=126(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 274
LDI r1, 20
LDI r2, 46
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 17
LDI r7, 275
LDI r8, 229
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 126
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
