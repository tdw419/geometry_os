; DESCRIPTION: Composite: Places a yellow dot at position (504, 178) then Renders a blue disk with center (346, 155) and radius 52 then Renders a green line between points (53, 97) and (168, 198).
; PLAN: r0=504(x), r1=178(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=155(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=53(x1), r11=97(y1), r12=168(x2), r13=198(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 504
LDI r1, 178
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 346
LDI r6, 155
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 53
LDI r11, 97
LDI r12, 168
LDI r13, 198
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
