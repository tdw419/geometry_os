; DESCRIPTION: Composite: Renders a white disk with center (157, 151) and radius 49 then Places a magenta 48x22 rectangle at position (411, 73) then Draws a white line from (246, 66) to (436, 150).
; PLAN: r0=157(x), r1=151(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x), r6=73(y), r7=48(width), r8=22(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=246(x1), r11=66(y1), r12=436(x2), r13=150(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 151
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 73
LDI r7, 48
LDI r8, 22
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 66
LDI r12, 436
LDI r13, 150
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
