; DESCRIPTION: Composite: Renders a blue line between points (448, 105) and (277, 111) then Places a magenta dot at position (334, 28) then Creates a red rectangular region at (364, 27) spanning 97 by 25 pixels.
; PLAN: r0=448(x1), r1=105(y1), r2=277(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=28(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=364(x), r11=27(y), r12=97(width), r13=25(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 105
LDI r2, 277
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 28
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 364
LDI r11, 27
LDI r12, 97
LDI r13, 25
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
