; DESCRIPTION: Composite: Creates a white rectangular region at (167, 34) spanning 47 by 104 pixels then Places a white line segment connecting (469, 247) to (169, 62) then Places a orange dot at position (211, 60).
; PLAN: r0=167(x), r1=34(y), r2=47(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=469(x1), r6=247(y1), r7=169(x2), r8=62(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=211(x), r11=60(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 167
LDI r1, 34
LDI r2, 47
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 247
LDI r7, 169
LDI r8, 62
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 60
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
