; DESCRIPTION: Composite: Creates a purple rectangular region at (190, 47) spanning 57 by 55 pixels then Renders a red line between points (395, 211) and (486, 92) then Sets a single green pixel at (315, 232).
; PLAN: r0=190(x), r1=47(y), r2=57(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=395(x1), r6=211(y1), r7=486(x2), r8=92(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=315(x), r11=232(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 47
LDI r2, 57
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 211
LDI r7, 486
LDI r8, 92
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 232
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
