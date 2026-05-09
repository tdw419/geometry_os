; DESCRIPTION: Composite: Draws a purple line from (147, 40) to (403, 120) then Creates a cyan circular shape at (307, 65) with radius 56.
; PLAN: r0=147(x1), r1=40(y1), r2=403(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=65(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 147
LDI r1, 40
LDI r2, 403
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 65
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
