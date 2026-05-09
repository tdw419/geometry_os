; DESCRIPTION: Composite: Renders a cyan disk with center (116, 189) and radius 58 then Renders a magenta line between points (253, 144) and (440, 232) then Places a black 63x27 rectangle at position (325, 29).
; PLAN: r0=116(x), r1=189(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=253(x1), r6=144(y1), r7=440(x2), r8=232(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=325(x), r11=29(y), r12=63(width), r13=27(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 189
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 253
LDI r6, 144
LDI r7, 440
LDI r8, 232
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 29
LDI r12, 63
LDI r13, 27
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
