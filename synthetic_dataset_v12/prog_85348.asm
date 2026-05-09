; DESCRIPTION: Composite: Places a cyan line segment connecting (391, 114) to (328, 253) then Creates a cyan rectangular region at (106, 11) spanning 77 by 112 pixels.
; PLAN: r0=391(x1), r1=114(y1), r2=328(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=11(y), r7=77(width), r8=112(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 114
LDI r2, 328
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 11
LDI r7, 77
LDI r8, 112
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
