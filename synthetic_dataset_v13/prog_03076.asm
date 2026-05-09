; DESCRIPTION: Composite: Creates a yellow circular shape at (124, 87) with radius 24 then Places a white line segment connecting (377, 253) to (403, 140) then Draws a white rectangle at (377, 77) with width 35 and height 57.
; PLAN: r0=124(x), r1=87(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x1), r6=253(y1), r7=403(x2), r8=140(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=377(x), r11=77(y), r12=35(width), r13=57(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 87
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 253
LDI r7, 403
LDI r8, 140
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 77
LDI r12, 35
LDI r13, 57
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
