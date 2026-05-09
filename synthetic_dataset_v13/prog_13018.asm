; DESCRIPTION: Composite: Places a red line segment connecting (499, 180) to (208, 138) then Creates a cyan rectangular region at (314, 183) spanning 55 by 57 pixels.
; PLAN: r0=499(x1), r1=180(y1), r2=208(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=183(y), r7=55(width), r8=57(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 499
LDI r1, 180
LDI r2, 208
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 183
LDI r7, 55
LDI r8, 57
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
