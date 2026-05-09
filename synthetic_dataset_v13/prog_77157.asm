; DESCRIPTION: Composite: Places a black dot at position (7, 175) then Places a cyan 49x109 rectangle at position (225, 90) then Draws a green line from (206, 87) to (12, 67).
; PLAN: r0=7(x), r1=175(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=225(x), r6=90(y), r7=49(width), r8=109(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x1), r11=87(y1), r12=12(x2), r13=67(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 7
LDI r1, 175
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 225
LDI r6, 90
LDI r7, 49
LDI r8, 109
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 87
LDI r12, 12
LDI r13, 67
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
