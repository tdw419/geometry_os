; DESCRIPTION: Composite: Creates a purple rectangular region at (35, 120) spanning 76 by 69 pixels then Places a blue line segment connecting (47, 213) to (450, 185).
; PLAN: r0=35(x), r1=120(y), r2=76(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=47(x1), r6=213(y1), r7=450(x2), r8=185(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 35
LDI r1, 120
LDI r2, 76
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 213
LDI r7, 450
LDI r8, 185
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
