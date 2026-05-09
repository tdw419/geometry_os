; DESCRIPTION: Composite: Places a cyan circle of radius 63 at center (155, 176) then Places a blue 38x58 rectangle at position (438, 111) then Renders a magenta line between points (470, 16) and (288, 115).
; PLAN: r0=155(x), r1=176(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x), r6=111(y), r7=38(width), r8=58(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=470(x1), r11=16(y1), r12=288(x2), r13=115(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 176
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 111
LDI r7, 38
LDI r8, 58
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 16
LDI r12, 288
LDI r13, 115
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
