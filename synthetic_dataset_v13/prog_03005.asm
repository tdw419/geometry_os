; DESCRIPTION: Composite: Creates a yellow rectangular region at (321, 157) spanning 66 by 16 pixels then Draws a white line from (275, 87) to (251, 138) then Places a magenta circle of radius 57 at center (67, 138).
; PLAN: r0=321(x), r1=157(y), r2=66(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x1), r6=87(y1), r7=251(x2), r8=138(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=67(x), r11=138(y), r12=57(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 321
LDI r1, 157
LDI r2, 66
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 87
LDI r7, 251
LDI r8, 138
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 138
LDI r12, 57
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
