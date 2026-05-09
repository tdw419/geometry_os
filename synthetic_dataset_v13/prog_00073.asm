; DESCRIPTION: Composite: Draws a yellow circle centered at (404, 54) with radius 27 then Renders a green line between points (196, 24) and (350, 255) then Places a blue 83x39 rectangle at position (220, 155).
; PLAN: r0=404(x), r1=54(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=196(x1), r6=24(y1), r7=350(x2), r8=255(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=220(x), r11=155(y), r12=83(width), r13=39(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 54
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 196
LDI r6, 24
LDI r7, 350
LDI r8, 255
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 155
LDI r12, 83
LDI r13, 39
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
