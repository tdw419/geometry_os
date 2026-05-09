; DESCRIPTION: Composite: Places a magenta dot at position (323, 250) then Places a white circle of radius 37 at center (114, 104) then Draws a white line from (86, 238) to (275, 42).
; PLAN: r0=323(x), r1=250(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=114(x), r6=104(y), r7=37(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=86(x1), r11=238(y1), r12=275(x2), r13=42(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 250
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 114
LDI r6, 104
LDI r7, 37
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 86
LDI r11, 238
LDI r12, 275
LDI r13, 42
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
