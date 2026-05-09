; DESCRIPTION: Composite: Creates a cyan rectangular region at (398, 54) spanning 31 by 107 pixels then Places a white line segment connecting (353, 31) to (29, 130).
; PLAN: r0=398(x), r1=54(y), r2=31(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x1), r6=31(y1), r7=29(x2), r8=130(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 54
LDI r2, 31
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 31
LDI r7, 29
LDI r8, 130
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
