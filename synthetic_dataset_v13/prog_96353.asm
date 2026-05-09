; DESCRIPTION: Composite: Renders a green line between points (381, 151) and (15, 129) then Sets a single orange pixel at (150, 113) then Draws a cyan rectangle at (38, 152) with width 29 and height 50.
; PLAN: r0=381(x1), r1=151(y1), r2=15(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=113(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=38(x), r11=152(y), r12=29(width), r13=50(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 151
LDI r2, 15
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 113
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 38
LDI r11, 152
LDI r12, 29
LDI r13, 50
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
