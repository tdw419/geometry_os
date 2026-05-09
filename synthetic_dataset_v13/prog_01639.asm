; DESCRIPTION: Composite: Renders a yellow line between points (427, 107) and (487, 55) then Creates a green rectangular region at (174, 8) spanning 107 by 27 pixels.
; PLAN: r0=427(x1), r1=107(y1), r2=487(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=8(y), r7=107(width), r8=27(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 107
LDI r2, 487
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 8
LDI r7, 107
LDI r8, 27
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
