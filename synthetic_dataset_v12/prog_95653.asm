; DESCRIPTION: Composite: Draws a magenta line from (301, 12) to (130, 211) then Creates a cyan circular shape at (156, 100) with radius 57.
; PLAN: r0=301(x1), r1=12(y1), r2=130(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=100(y), r7=57(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 12
LDI r2, 130
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 100
LDI r7, 57
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
