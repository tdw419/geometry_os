; DESCRIPTION: Composite: Sets a single magenta pixel at (21, 80) then Places a blue line segment connecting (403, 91) to (439, 105) then Places a purple 36x97 rectangle at position (10, 143).
; PLAN: r0=21(x), r1=80(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=403(x1), r6=91(y1), r7=439(x2), r8=105(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=10(x), r11=143(y), r12=36(width), r13=97(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 21
LDI r1, 80
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 403
LDI r6, 91
LDI r7, 439
LDI r8, 105
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 10
LDI r11, 143
LDI r12, 36
LDI r13, 97
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
