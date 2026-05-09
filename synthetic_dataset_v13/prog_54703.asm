; DESCRIPTION: Composite: Draws a orange line from (83, 178) to (454, 122) then Places a cyan circle of radius 42 at center (208, 154).
; PLAN: r0=83(x1), r1=178(y1), r2=454(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=154(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 83
LDI r1, 178
LDI r2, 454
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 154
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
