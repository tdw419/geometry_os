; DESCRIPTION: Composite: Places a orange line segment connecting (48, 79) to (46, 94) then Places a red circle of radius 72 at center (352, 106).
; PLAN: r0=48(x1), r1=79(y1), r2=46(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=352(x), r6=106(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 48
LDI r1, 79
LDI r2, 46
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 106
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
