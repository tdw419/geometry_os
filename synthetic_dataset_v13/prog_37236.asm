; DESCRIPTION: Composite: Places a magenta dot at position (454, 233) then Places a white line segment connecting (291, 217) to (440, 115) then Creates a purple rectangular region at (39, 139) spanning 19 by 106 pixels.
; PLAN: r0=454(x), r1=233(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=291(x1), r6=217(y1), r7=440(x2), r8=115(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=39(x), r11=139(y), r12=19(width), r13=106(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 233
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 291
LDI r6, 217
LDI r7, 440
LDI r8, 115
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 139
LDI r12, 19
LDI r13, 106
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
