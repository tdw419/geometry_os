; DESCRIPTION: Composite: Draws a black line from (486, 240) to (479, 197) then Renders a black disk with center (103, 127) and radius 34 then Places a blue 46x90 rectangle at position (123, 13).
; PLAN: r0=486(x1), r1=240(y1), r2=479(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=127(y), r7=34(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=123(x), r11=13(y), r12=46(width), r13=90(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 486
LDI r1, 240
LDI r2, 479
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 127
LDI r7, 34
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 123
LDI r11, 13
LDI r12, 46
LDI r13, 90
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
