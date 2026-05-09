; DESCRIPTION: Composite: Draws a white circle centered at (146, 147) with radius 52 then Renders a orange box of size 78x113 starting at (426, 60) then Draws a blue line from (92, 250) to (500, 124).
; PLAN: r0=146(x), r1=147(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x), r6=60(y), r7=78(width), r8=113(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=92(x1), r11=250(y1), r12=500(x2), r13=124(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 147
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 60
LDI r7, 78
LDI r8, 113
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 250
LDI r12, 500
LDI r13, 124
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
