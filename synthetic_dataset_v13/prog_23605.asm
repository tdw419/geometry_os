; DESCRIPTION: Composite: Draws a white circle centered at (120, 184) with radius 25 then Renders a black box of size 27x57 starting at (436, 172) then Renders a magenta line between points (271, 201) and (320, 152).
; PLAN: r0=120(x), r1=184(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x), r6=172(y), r7=27(width), r8=57(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=271(x1), r11=201(y1), r12=320(x2), r13=152(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 184
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 172
LDI r7, 27
LDI r8, 57
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 201
LDI r12, 320
LDI r13, 152
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
