; DESCRIPTION: Composite: Places a red line segment connecting (408, 199) to (455, 132) then Places a white circle of radius 50 at center (400, 70).
; PLAN: r0=408(x1), r1=199(y1), r2=455(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=70(y), r7=50(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 408
LDI r1, 199
LDI r2, 455
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 70
LDI r7, 50
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
