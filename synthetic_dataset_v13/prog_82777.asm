; DESCRIPTION: Composite: Draws a green line from (483, 136) to (393, 30) then Places a green dot at position (435, 186) then Renders a white box of size 19x61 starting at (2, 46).
; PLAN: r0=483(x1), r1=136(y1), r2=393(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=435(x), r6=186(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=2(x), r11=46(y), r12=19(width), r13=61(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 483
LDI r1, 136
LDI r2, 393
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 186
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 2
LDI r11, 46
LDI r12, 19
LDI r13, 61
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
