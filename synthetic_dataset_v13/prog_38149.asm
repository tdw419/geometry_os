; DESCRIPTION: Composite: Places a magenta dot at position (484, 230) then Draws a white circle centered at (138, 140) with radius 58 then Draws a white line from (242, 96) to (44, 177).
; PLAN: r0=484(x), r1=230(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=140(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=242(x1), r11=96(y1), r12=44(x2), r13=177(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 230
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 138
LDI r6, 140
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 242
LDI r11, 96
LDI r12, 44
LDI r13, 177
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
