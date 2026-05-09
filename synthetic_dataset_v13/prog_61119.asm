; DESCRIPTION: Composite: Creates a cyan rectangular region at (278, 89) spanning 102 by 94 pixels then Renders a white line between points (91, 239) and (177, 4).
; PLAN: r0=278(x), r1=89(y), r2=102(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x1), r6=239(y1), r7=177(x2), r8=4(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 89
LDI r2, 102
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 239
LDI r7, 177
LDI r8, 4
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
