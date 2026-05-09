; DESCRIPTION: Composite: Draws a orange circle centered at (381, 197) with radius 59 then Places a green dot at position (73, 224) then Draws a blue line from (296, 244) to (502, 182).
; PLAN: r0=381(x), r1=197(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x), r6=224(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=296(x1), r11=244(y1), r12=502(x2), r13=182(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 197
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 224
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 296
LDI r11, 244
LDI r12, 502
LDI r13, 182
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
