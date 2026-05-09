; DESCRIPTION: Composite: Creates a cyan rectangular region at (164, 184) spanning 44 by 34 pixels then Places a purple line segment connecting (11, 223) to (486, 249).
; PLAN: r0=164(x), r1=184(y), r2=44(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x1), r6=223(y1), r7=486(x2), r8=249(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 184
LDI r2, 44
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 223
LDI r7, 486
LDI r8, 249
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
