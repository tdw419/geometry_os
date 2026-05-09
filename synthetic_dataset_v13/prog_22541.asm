; DESCRIPTION: Composite: Renders a red line between points (60, 20) and (90, 110) then Creates a cyan rectangular region at (320, 171) spanning 105 by 60 pixels then Sets a single purple pixel at (136, 161).
; PLAN: r0=60(x1), r1=20(y1), r2=90(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=171(y), r7=105(width), r8=60(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=136(x), r11=161(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 60
LDI r1, 20
LDI r2, 90
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 171
LDI r7, 105
LDI r8, 60
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 161
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
