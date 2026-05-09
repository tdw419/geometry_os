; DESCRIPTION: Composite: Places a black dot at position (470, 78) then Places a black line segment connecting (50, 185) to (68, 125).
; PLAN: r0=470(x), r1=78(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=50(x1), r6=185(y1), r7=68(x2), r8=125(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 470
LDI r1, 78
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 50
LDI r6, 185
LDI r7, 68
LDI r8, 125
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
