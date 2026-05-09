; DESCRIPTION: Composite: Draws a cyan line from (315, 204) to (146, 124) then Creates a purple rectangular region at (415, 26) spanning 24 by 29 pixels then Renders a magenta disk with center (104, 187) and radius 67.
; PLAN: r0=315(x1), r1=204(y1), r2=146(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=26(y), r7=24(width), r8=29(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x), r11=187(y), r12=67(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 315
LDI r1, 204
LDI r2, 146
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 26
LDI r7, 24
LDI r8, 29
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 187
LDI r12, 67
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
