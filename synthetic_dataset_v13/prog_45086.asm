; DESCRIPTION: Composite: Creates a white circular shape at (217, 178) with radius 59 then Draws a black line from (484, 255) to (344, 62).
; PLAN: r0=217(x), r1=178(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x1), r6=255(y1), r7=344(x2), r8=62(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 178
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 255
LDI r7, 344
LDI r8, 62
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
