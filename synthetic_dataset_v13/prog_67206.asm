; DESCRIPTION: Composite: Creates a cyan circular shape at (299, 201) with radius 13 then Places a orange dot at position (194, 251) then Draws a magenta line from (4, 50) to (335, 113).
; PLAN: r0=299(x), r1=201(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=251(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=4(x1), r11=50(y1), r12=335(x2), r13=113(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 201
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 251
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 4
LDI r11, 50
LDI r12, 335
LDI r13, 113
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
