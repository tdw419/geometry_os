; DESCRIPTION: Composite: Creates a red rectangular region at (333, 3) spanning 76 by 58 pixels then Places a blue line segment connecting (152, 98) to (234, 205).
; PLAN: r0=333(x), r1=3(y), r2=76(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x1), r6=98(y1), r7=234(x2), r8=205(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 3
LDI r2, 76
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 98
LDI r7, 234
LDI r8, 205
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
