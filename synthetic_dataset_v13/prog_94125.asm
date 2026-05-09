; DESCRIPTION: Composite: Creates a cyan rectangular region at (198, 19) spanning 54 by 19 pixels then Places a white dot at position (386, 226) then Places a green line segment connecting (261, 80) to (235, 175).
; PLAN: r0=198(x), r1=19(y), r2=54(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x), r6=226(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=261(x1), r11=80(y1), r12=235(x2), r13=175(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 19
LDI r2, 54
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 226
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 261
LDI r11, 80
LDI r12, 235
LDI r13, 175
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
