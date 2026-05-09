; DESCRIPTION: Composite: Draws a cyan line from (386, 17) to (57, 31) then Renders a orange disk with center (31, 62) and radius 29 then Creates a orange rectangular region at (428, 148) spanning 25 by 48 pixels.
; PLAN: r0=386(x1), r1=17(y1), r2=57(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=31(x), r6=62(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=428(x), r11=148(y), r12=25(width), r13=48(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 17
LDI r2, 57
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 62
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 428
LDI r11, 148
LDI r12, 25
LDI r13, 48
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
