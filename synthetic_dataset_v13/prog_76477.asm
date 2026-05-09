; DESCRIPTION: Composite: Places a purple dot at position (105, 169) then Places a blue line segment connecting (108, 213) to (354, 146) then Creates a blue rectangular region at (436, 37) spanning 52 by 46 pixels.
; PLAN: r0=105(x), r1=169(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=108(x1), r6=213(y1), r7=354(x2), r8=146(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=436(x), r11=37(y), r12=52(width), r13=46(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 169
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 108
LDI r6, 213
LDI r7, 354
LDI r8, 146
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 37
LDI r12, 52
LDI r13, 46
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
