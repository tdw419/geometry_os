; DESCRIPTION: Composite: Creates a green rectangular region at (364, 45) spanning 106 by 71 pixels then Sets a single orange pixel at (359, 46) then Renders a cyan line between points (440, 103) and (423, 120).
; PLAN: r0=364(x), r1=45(y), r2=106(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x), r6=46(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=440(x1), r11=103(y1), r12=423(x2), r13=120(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 45
LDI r2, 106
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 46
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 440
LDI r11, 103
LDI r12, 423
LDI r13, 120
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
