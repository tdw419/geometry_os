; DESCRIPTION: Composite: Draws a black line from (506, 33) to (164, 78) then Places a black 22x110 rectangle at position (278, 140).
; PLAN: r0=506(x1), r1=33(y1), r2=164(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=140(y), r7=22(width), r8=110(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 506
LDI r1, 33
LDI r2, 164
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 140
LDI r7, 22
LDI r8, 110
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
