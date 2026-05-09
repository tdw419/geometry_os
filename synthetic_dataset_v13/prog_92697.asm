; DESCRIPTION: Composite: Renders a yellow disk with center (56, 20) and radius 12 then Draws a cyan line from (146, 223) to (261, 59) then Creates a orange rectangular region at (364, 79) spanning 92 by 115 pixels.
; PLAN: r0=56(x), r1=20(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x1), r6=223(y1), r7=261(x2), r8=59(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=364(x), r11=79(y), r12=92(width), r13=115(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 20
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 223
LDI r7, 261
LDI r8, 59
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 79
LDI r12, 92
LDI r13, 115
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
