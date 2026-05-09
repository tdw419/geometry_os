; DESCRIPTION: Composite: Renders a purple box of size 46x37 starting at (294, 76) then Sets a single green pixel at (187, 37) then Renders a blue line between points (463, 231) and (4, 207).
; PLAN: r0=294(x), r1=76(y), r2=46(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=37(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=463(x1), r11=231(y1), r12=4(x2), r13=207(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 76
LDI r2, 46
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 37
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 463
LDI r11, 231
LDI r12, 4
LDI r13, 207
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
