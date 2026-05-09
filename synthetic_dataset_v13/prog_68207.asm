; DESCRIPTION: Composite: Places a magenta dot at position (428, 225) then Draws a yellow circle centered at (131, 131) with radius 66 then Draws a red line from (373, 61) to (51, 12).
; PLAN: r0=428(x), r1=225(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=131(y), r7=66(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=373(x1), r11=61(y1), r12=51(x2), r13=12(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 428
LDI r1, 225
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 131
LDI r7, 66
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 373
LDI r11, 61
LDI r12, 51
LDI r13, 12
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
