; DESCRIPTION: Composite: Places a yellow dot at position (382, 226) then Places a white line segment connecting (135, 206) to (12, 44) then Places a white 114x17 rectangle at position (381, 205).
; PLAN: r0=382(x), r1=226(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=135(x1), r6=206(y1), r7=12(x2), r8=44(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=381(x), r11=205(y), r12=114(width), r13=17(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 226
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 135
LDI r6, 206
LDI r7, 12
LDI r8, 44
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 205
LDI r12, 114
LDI r13, 17
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
