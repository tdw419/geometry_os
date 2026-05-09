; DESCRIPTION: Composite: Sets a single blue pixel at (502, 192) then Creates a magenta circular shape at (316, 188) with radius 68 then Renders a green line between points (297, 17) and (473, 98).
; PLAN: r0=502(x), r1=192(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=188(y), r7=68(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=297(x1), r11=17(y1), r12=473(x2), r13=98(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 502
LDI r1, 192
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 316
LDI r6, 188
LDI r7, 68
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 297
LDI r11, 17
LDI r12, 473
LDI r13, 98
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
