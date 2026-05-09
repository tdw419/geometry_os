; DESCRIPTION: Composite: Draws a red line from (126, 41) to (319, 231) then Draws a white circle centered at (72, 162) with radius 60 then Places a green dot at position (123, 207).
; PLAN: r0=126(x1), r1=41(y1), r2=319(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=162(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=123(x), r11=207(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 126
LDI r1, 41
LDI r2, 319
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 162
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 123
LDI r11, 207
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
