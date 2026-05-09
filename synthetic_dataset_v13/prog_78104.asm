; DESCRIPTION: Composite: Creates a green rectangular region at (124, 164) spanning 30 by 91 pixels then Places a green line segment connecting (16, 2) to (125, 186).
; PLAN: r0=124(x), r1=164(y), r2=30(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x1), r6=2(y1), r7=125(x2), r8=186(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 164
LDI r2, 30
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 2
LDI r7, 125
LDI r8, 186
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
