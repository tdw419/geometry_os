; DESCRIPTION: Composite: Draws a black line from (187, 112) to (19, 188) then Creates a orange rectangular region at (12, 36) spanning 31 by 53 pixels.
; PLAN: r0=187(x1), r1=112(y1), r2=19(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=12(x), r6=36(y), r7=31(width), r8=53(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 187
LDI r1, 112
LDI r2, 19
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 36
LDI r7, 31
LDI r8, 53
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
