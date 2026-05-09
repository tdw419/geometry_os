; DESCRIPTION: Composite: Places a green dot at position (317, 163) then Places a yellow 64x85 rectangle at position (197, 69) then Draws a red line from (470, 200) to (195, 174).
; PLAN: r0=317(x), r1=163(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=197(x), r6=69(y), r7=64(width), r8=85(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=470(x1), r11=200(y1), r12=195(x2), r13=174(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 163
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 197
LDI r6, 69
LDI r7, 64
LDI r8, 85
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 200
LDI r12, 195
LDI r13, 174
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
