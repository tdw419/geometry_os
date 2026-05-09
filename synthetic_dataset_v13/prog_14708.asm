; DESCRIPTION: Composite: Creates a white rectangular region at (135, 177) spanning 77 by 79 pixels then Renders a black line between points (277, 180) and (358, 46) then Places a orange circle of radius 46 at center (56, 135).
; PLAN: r0=135(x), r1=177(y), r2=77(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x1), r6=180(y1), r7=358(x2), r8=46(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=56(x), r11=135(y), r12=46(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 135
LDI r1, 177
LDI r2, 77
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 180
LDI r7, 358
LDI r8, 46
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 135
LDI r12, 46
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
