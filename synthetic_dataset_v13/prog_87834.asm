; DESCRIPTION: Composite: Creates a yellow rectangular region at (369, 12) spanning 55 by 117 pixels then Renders a cyan line between points (492, 85) and (414, 197) then Sets a single red pixel at (24, 215).
; PLAN: r0=369(x), r1=12(y), r2=55(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x1), r6=85(y1), r7=414(x2), r8=197(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=24(x), r11=215(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 369
LDI r1, 12
LDI r2, 55
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 85
LDI r7, 414
LDI r8, 197
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 24
LDI r11, 215
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
