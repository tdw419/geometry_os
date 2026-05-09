; DESCRIPTION: Composite: Places a green circle of radius 38 at center (204, 44) then Places a yellow 62x73 rectangle at position (15, 74) then Draws a white line from (152, 202) to (336, 146).
; PLAN: r0=204(x), r1=44(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=74(y), r7=62(width), r8=73(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=152(x1), r11=202(y1), r12=336(x2), r13=146(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 44
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 74
LDI r7, 62
LDI r8, 73
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 202
LDI r12, 336
LDI r13, 146
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
