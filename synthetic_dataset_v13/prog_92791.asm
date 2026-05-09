; DESCRIPTION: Composite: Places a purple dot at position (209, 152) then Draws a orange line from (324, 230) to (60, 239) then Renders a magenta disk with center (333, 165) and radius 75.
; PLAN: r0=209(x), r1=152(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=324(x1), r6=230(y1), r7=60(x2), r8=239(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=165(y), r12=75(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 209
LDI r1, 152
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 230
LDI r7, 60
LDI r8, 239
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 165
LDI r12, 75
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
