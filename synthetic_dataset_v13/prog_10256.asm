; DESCRIPTION: Composite: Renders a blue box of size 92x20 starting at (292, 60) then Places a white line segment connecting (89, 193) to (483, 241).
; PLAN: r0=292(x), r1=60(y), r2=92(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x1), r6=193(y1), r7=483(x2), r8=241(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 60
LDI r2, 92
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 193
LDI r7, 483
LDI r8, 241
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
