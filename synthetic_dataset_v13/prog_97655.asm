; DESCRIPTION: Composite: Sets a single yellow pixel at (407, 17) then Draws a cyan line from (169, 244) to (502, 99) then Creates a orange rectangular region at (310, 225) spanning 55 by 23 pixels.
; PLAN: r0=407(x), r1=17(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=169(x1), r6=244(y1), r7=502(x2), r8=99(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=225(y), r12=55(width), r13=23(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 17
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 169
LDI r6, 244
LDI r7, 502
LDI r8, 99
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 225
LDI r12, 55
LDI r13, 23
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
