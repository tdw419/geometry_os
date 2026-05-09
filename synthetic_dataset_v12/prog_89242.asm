; DESCRIPTION: Composite: Draws a white rectangle at (284, 22) with width 67 and height 84 then Places a yellow dot at position (335, 50) then Renders a black line between points (12, 223) and (349, 144).
; PLAN: r0=284(x), r1=22(y), r2=67(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x), r6=50(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=12(x1), r11=223(y1), r12=349(x2), r13=144(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 22
LDI r2, 67
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 50
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 12
LDI r11, 223
LDI r12, 349
LDI r13, 144
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
