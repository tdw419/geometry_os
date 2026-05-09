; DESCRIPTION: Composite: Renders a purple disk with center (235, 77) and radius 49 then Places a blue line segment connecting (464, 194) to (489, 184) then Places a white 50x33 rectangle at position (274, 56).
; PLAN: r0=235(x), r1=77(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=464(x1), r6=194(y1), r7=489(x2), r8=184(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=56(y), r12=50(width), r13=33(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 77
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 464
LDI r6, 194
LDI r7, 489
LDI r8, 184
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 56
LDI r12, 50
LDI r13, 33
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
