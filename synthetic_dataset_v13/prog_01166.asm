; DESCRIPTION: Composite: Renders a black line between points (335, 209) and (290, 188) then Renders a black box of size 25x77 starting at (85, 47) then Renders a orange disk with center (300, 190) and radius 47.
; PLAN: r0=335(x1), r1=209(y1), r2=290(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=47(y), r7=25(width), r8=77(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=300(x), r11=190(y), r12=47(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 335
LDI r1, 209
LDI r2, 290
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 47
LDI r7, 25
LDI r8, 77
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 190
LDI r12, 47
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
