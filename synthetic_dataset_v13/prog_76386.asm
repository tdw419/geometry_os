; DESCRIPTION: Composite: Places a cyan dot at position (338, 49) then Draws a cyan circle centered at (258, 123) with radius 80 then Draws a white line from (68, 149) to (197, 113).
; PLAN: r0=338(x), r1=49(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=258(x), r6=123(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x1), r11=149(y1), r12=197(x2), r13=113(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 49
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 258
LDI r6, 123
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 149
LDI r12, 197
LDI r13, 113
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
