; DESCRIPTION: Composite: Draws a black line from (188, 217) to (385, 180) then Creates a orange rectangular region at (275, 53) spanning 47 by 14 pixels.
; PLAN: r0=188(x1), r1=217(y1), r2=385(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=53(y), r7=47(width), r8=14(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 217
LDI r2, 385
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 53
LDI r7, 47
LDI r8, 14
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
