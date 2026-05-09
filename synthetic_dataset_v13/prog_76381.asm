; DESCRIPTION: Composite: Renders a cyan line between points (108, 28) and (417, 249) then Creates a green rectangular region at (26, 51) spanning 49 by 113 pixels then Sets a single orange pixel at (294, 152).
; PLAN: r0=108(x1), r1=28(y1), r2=417(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=51(y), r7=49(width), r8=113(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=294(x), r11=152(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 28
LDI r2, 417
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 51
LDI r7, 49
LDI r8, 113
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 152
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
