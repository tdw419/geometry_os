; DESCRIPTION: Composite: Draws a green line from (98, 22) to (415, 254) then Creates a red circular shape at (269, 127) with radius 31.
; PLAN: r0=98(x1), r1=22(y1), r2=415(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=127(y), r7=31(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 98
LDI r1, 22
LDI r2, 415
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 127
LDI r7, 31
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
