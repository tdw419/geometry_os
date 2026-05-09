; DESCRIPTION: Composite: Places a cyan line segment connecting (83, 5) to (132, 45) then Creates a yellow rectangular region at (17, 204) spanning 25 by 51 pixels.
; PLAN: r0=83(x1), r1=5(y1), r2=132(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=204(y), r7=25(width), r8=51(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 5
LDI r2, 132
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 204
LDI r7, 25
LDI r8, 51
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
