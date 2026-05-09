; DESCRIPTION: Composite: Places a cyan line segment connecting (292, 46) to (321, 149) then Creates a yellow rectangular region at (166, 78) spanning 45 by 71 pixels then Places a cyan dot at position (208, 113).
; PLAN: r0=292(x1), r1=46(y1), r2=321(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=78(y), r7=45(width), r8=71(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x), r11=113(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 292
LDI r1, 46
LDI r2, 321
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 78
LDI r7, 45
LDI r8, 71
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 113
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
