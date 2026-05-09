; DESCRIPTION: Composite: Creates a red rectangular region at (383, 187) spanning 79 by 15 pixels then Renders a cyan line between points (172, 91) and (224, 3) then Sets a single yellow pixel at (81, 81).
; PLAN: r0=383(x), r1=187(y), r2=79(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x1), r6=91(y1), r7=224(x2), r8=3(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=81(x), r11=81(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 383
LDI r1, 187
LDI r2, 79
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 91
LDI r7, 224
LDI r8, 3
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 81
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
