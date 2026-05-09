; DESCRIPTION: Composite: Sets a single black pixel at (93, 120) then Draws a green circle centered at (190, 84) with radius 33 then Draws a magenta line from (64, 44) to (404, 198).
; PLAN: r0=93(x), r1=120(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=190(x), r6=84(y), r7=33(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=64(x1), r11=44(y1), r12=404(x2), r13=198(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 120
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 190
LDI r6, 84
LDI r7, 33
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 64
LDI r11, 44
LDI r12, 404
LDI r13, 198
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
