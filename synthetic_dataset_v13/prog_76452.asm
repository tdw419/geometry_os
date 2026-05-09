; DESCRIPTION: Composite: Draws a magenta line from (283, 206) to (325, 229) then Creates a cyan circular shape at (174, 202) with radius 33.
; PLAN: r0=283(x1), r1=206(y1), r2=325(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=202(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 283
LDI r1, 206
LDI r2, 325
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 202
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
