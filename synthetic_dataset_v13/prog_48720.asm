; DESCRIPTION: Composite: Draws a cyan circle centered at (154, 170) with radius 46 then Draws a magenta line from (311, 191) to (500, 231).
; PLAN: r0=154(x), r1=170(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x1), r6=191(y1), r7=500(x2), r8=231(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 170
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 191
LDI r7, 500
LDI r8, 231
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
