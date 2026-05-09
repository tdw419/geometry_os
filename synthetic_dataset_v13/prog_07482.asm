; DESCRIPTION: Composite: Creates a cyan rectangular region at (152, 49) spanning 20 by 41 pixels then Renders a red line between points (278, 52) and (213, 65) then Sets a single orange pixel at (264, 150).
; PLAN: r0=152(x), r1=49(y), r2=20(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x1), r6=52(y1), r7=213(x2), r8=65(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=264(x), r11=150(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 152
LDI r1, 49
LDI r2, 20
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 52
LDI r7, 213
LDI r8, 65
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 150
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
