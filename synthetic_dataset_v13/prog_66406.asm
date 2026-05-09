; DESCRIPTION: Composite: Sets a single cyan pixel at (9, 100) then Renders a blue line between points (169, 202) and (201, 253) then Creates a yellow rectangular region at (174, 13) spanning 54 by 60 pixels.
; PLAN: r0=9(x), r1=100(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=169(x1), r6=202(y1), r7=201(x2), r8=253(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=174(x), r11=13(y), r12=54(width), r13=60(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 9
LDI r1, 100
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 169
LDI r6, 202
LDI r7, 201
LDI r8, 253
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 13
LDI r12, 54
LDI r13, 60
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
