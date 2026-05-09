; DESCRIPTION: Composite: Places a green dot at position (476, 55) then Places a orange line segment connecting (92, 159) to (303, 38).
; PLAN: r0=476(x), r1=55(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=92(x1), r6=159(y1), r7=303(x2), r8=38(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 476
LDI r1, 55
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 92
LDI r6, 159
LDI r7, 303
LDI r8, 38
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
