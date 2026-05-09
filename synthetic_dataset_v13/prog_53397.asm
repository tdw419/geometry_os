; DESCRIPTION: Composite: Renders a blue disk with center (330, 197) and radius 46 then Renders a black line between points (62, 241) and (405, 60) then Places a yellow 72x18 rectangle at position (186, 209).
; PLAN: r0=330(x), r1=197(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=62(x1), r6=241(y1), r7=405(x2), r8=60(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=186(x), r11=209(y), r12=72(width), r13=18(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 197
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 62
LDI r6, 241
LDI r7, 405
LDI r8, 60
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 186
LDI r11, 209
LDI r12, 72
LDI r13, 18
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
