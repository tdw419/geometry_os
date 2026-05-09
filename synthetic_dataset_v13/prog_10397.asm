; DESCRIPTION: Composite: Creates a yellow circular shape at (128, 152) with radius 80 then Draws a white rectangle at (53, 171) with width 36 and height 80 then Renders a yellow line between points (502, 122) and (397, 238).
; PLAN: r0=128(x), r1=152(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=171(y), r7=36(width), r8=80(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=502(x1), r11=122(y1), r12=397(x2), r13=238(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 128
LDI r1, 152
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 171
LDI r7, 36
LDI r8, 80
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 502
LDI r11, 122
LDI r12, 397
LDI r13, 238
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
