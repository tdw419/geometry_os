; DESCRIPTION: Composite: Creates a black rectangular region at (441, 44) spanning 38 by 65 pixels then Renders a orange line between points (38, 105) and (48, 46).
; PLAN: r0=441(x), r1=44(y), r2=38(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x1), r6=105(y1), r7=48(x2), r8=46(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 44
LDI r2, 38
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 105
LDI r7, 48
LDI r8, 46
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
