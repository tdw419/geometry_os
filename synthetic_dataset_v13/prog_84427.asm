; DESCRIPTION: Composite: Sets a single cyan pixel at (12, 251) then Creates a green rectangular region at (281, 124) spanning 99 by 100 pixels then Places a magenta line segment connecting (135, 66) to (34, 247).
; PLAN: r0=12(x), r1=251(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=124(y), r7=99(width), r8=100(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=135(x1), r11=66(y1), r12=34(x2), r13=247(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 12
LDI r1, 251
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 281
LDI r6, 124
LDI r7, 99
LDI r8, 100
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 66
LDI r12, 34
LDI r13, 247
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
