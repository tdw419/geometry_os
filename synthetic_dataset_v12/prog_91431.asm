; DESCRIPTION: Composite: Places a red line segment connecting (263, 112) to (423, 39) then Creates a cyan rectangular region at (355, 9) spanning 37 by 11 pixels.
; PLAN: r0=263(x1), r1=112(y1), r2=423(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=9(y), r7=37(width), r8=11(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 112
LDI r2, 423
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 9
LDI r7, 37
LDI r8, 11
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
