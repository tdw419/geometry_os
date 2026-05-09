; DESCRIPTION: Composite: Creates a green rectangular region at (42, 150) spanning 110 by 71 pixels then Renders a purple line between points (287, 234) and (300, 224) then Sets a single black pixel at (503, 209).
; PLAN: r0=42(x), r1=150(y), r2=110(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x1), r6=234(y1), r7=300(x2), r8=224(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=503(x), r11=209(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 42
LDI r1, 150
LDI r2, 110
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 234
LDI r7, 300
LDI r8, 224
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 209
LDI r12, 0x000000
PSET r10, r11, r12
HALT
