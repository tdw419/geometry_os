; DESCRIPTION: Composite: Places a blue line segment connecting (323, 255) to (136, 127) then Renders a cyan disk with center (176, 171) and radius 58 then Places a yellow 37x46 rectangle at position (441, 209).
; PLAN: r0=323(x1), r1=255(y1), r2=136(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=171(y), r7=58(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=441(x), r11=209(y), r12=37(width), r13=46(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 255
LDI r2, 136
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 171
LDI r7, 58
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 441
LDI r11, 209
LDI r12, 37
LDI r13, 46
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
