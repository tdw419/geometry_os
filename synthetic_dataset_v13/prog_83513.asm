; DESCRIPTION: Composite: Sets a single blue pixel at (138, 171) then Creates a red circular shape at (373, 84) with radius 64 then Draws a yellow line from (384, 176) to (150, 199).
; PLAN: r0=138(x), r1=171(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=373(x), r6=84(y), r7=64(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=384(x1), r11=176(y1), r12=150(x2), r13=199(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 171
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 373
LDI r6, 84
LDI r7, 64
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 384
LDI r11, 176
LDI r12, 150
LDI r13, 199
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
