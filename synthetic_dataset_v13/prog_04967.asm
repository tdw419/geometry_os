; DESCRIPTION: Composite: Sets a single green pixel at (106, 115) then Places a cyan line segment connecting (275, 150) to (10, 167) then Creates a green rectangular region at (308, 89) spanning 65 by 77 pixels.
; PLAN: r0=106(x), r1=115(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=275(x1), r6=150(y1), r7=10(x2), r8=167(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=89(y), r12=65(width), r13=77(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 115
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 275
LDI r6, 150
LDI r7, 10
LDI r8, 167
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 89
LDI r12, 65
LDI r13, 77
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
