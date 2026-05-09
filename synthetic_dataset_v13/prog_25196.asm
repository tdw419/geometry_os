; DESCRIPTION: Composite: Places a white line segment connecting (351, 95) to (91, 100) then Places a yellow 85x50 rectangle at position (411, 65).
; PLAN: r0=351(x1), r1=95(y1), r2=91(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=411(x), r6=65(y), r7=85(width), r8=50(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 95
LDI r2, 91
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 65
LDI r7, 85
LDI r8, 50
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
