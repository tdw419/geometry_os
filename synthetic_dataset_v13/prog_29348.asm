; DESCRIPTION: Composite: Places a yellow line segment connecting (284, 154) to (173, 152) then Draws a green circle centered at (138, 136) with radius 13.
; PLAN: r0=284(x1), r1=154(y1), r2=173(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=136(y), r7=13(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 284
LDI r1, 154
LDI r2, 173
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 136
LDI r7, 13
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
