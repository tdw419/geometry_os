; DESCRIPTION: Composite: Places a red dot at position (274, 107) then Creates a cyan rectangular region at (70, 156) spanning 75 by 49 pixels then Renders a white line between points (91, 94) and (91, 64).
; PLAN: r0=274(x), r1=107(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=70(x), r6=156(y), r7=75(width), r8=49(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=91(x1), r11=94(y1), r12=91(x2), r13=64(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 107
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 70
LDI r6, 156
LDI r7, 75
LDI r8, 49
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 94
LDI r12, 91
LDI r13, 64
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
