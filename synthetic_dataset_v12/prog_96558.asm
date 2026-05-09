; DESCRIPTION: Composite: Draws a green line from (174, 60) to (177, 4) then Places a cyan 39x33 rectangle at position (250, 201) then Creates a black circular shape at (205, 151) with radius 50.
; PLAN: r0=174(x1), r1=60(y1), r2=177(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=201(y), r7=39(width), r8=33(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x), r11=151(y), r12=50(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 174
LDI r1, 60
LDI r2, 177
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 201
LDI r7, 39
LDI r8, 33
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 151
LDI r12, 50
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
