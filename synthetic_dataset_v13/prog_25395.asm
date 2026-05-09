; DESCRIPTION: Composite: Draws a black rectangle at (160, 112) with width 103 and height 26 then Places a green dot at position (298, 202) then Renders a yellow line between points (13, 108) and (165, 247).
; PLAN: r0=160(x), r1=112(y), r2=103(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x), r6=202(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=13(x1), r11=108(y1), r12=165(x2), r13=247(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 112
LDI r2, 103
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 202
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 13
LDI r11, 108
LDI r12, 165
LDI r13, 247
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
