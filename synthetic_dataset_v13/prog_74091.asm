; DESCRIPTION: Composite: Draws a magenta line from (201, 223) to (466, 242) then Creates a yellow circular shape at (314, 139) with radius 59 then Places a green dot at position (283, 178).
; PLAN: r0=201(x1), r1=223(y1), r2=466(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=139(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=283(x), r11=178(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 201
LDI r1, 223
LDI r2, 466
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 139
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 283
LDI r11, 178
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
