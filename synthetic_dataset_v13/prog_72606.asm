; DESCRIPTION: Composite: Sets a single cyan pixel at (56, 28) then Places a magenta circle of radius 31 at center (357, 99) then Draws a blue line from (36, 227) to (36, 143).
; PLAN: r0=56(x), r1=28(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=99(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=36(x1), r11=227(y1), r12=36(x2), r13=143(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 28
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 99
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 36
LDI r11, 227
LDI r12, 36
LDI r13, 143
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
