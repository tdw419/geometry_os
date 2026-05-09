; DESCRIPTION: Composite: Places a magenta dot at position (314, 194) then Places a yellow line segment connecting (323, 239) to (290, 129) then Creates a red circular shape at (57, 73) with radius 31.
; PLAN: r0=314(x), r1=194(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=323(x1), r6=239(y1), r7=290(x2), r8=129(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=57(x), r11=73(y), r12=31(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 314
LDI r1, 194
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 323
LDI r6, 239
LDI r7, 290
LDI r8, 129
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 73
LDI r12, 31
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
