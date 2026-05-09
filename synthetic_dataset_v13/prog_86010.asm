; DESCRIPTION: Composite: Creates a purple rectangular region at (189, 48) spanning 44 by 53 pixels then Places a black line segment connecting (143, 70) to (37, 117).
; PLAN: r0=189(x), r1=48(y), r2=44(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x1), r6=70(y1), r7=37(x2), r8=117(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 48
LDI r2, 44
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 70
LDI r7, 37
LDI r8, 117
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
