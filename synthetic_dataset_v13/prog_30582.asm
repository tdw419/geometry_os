; DESCRIPTION: Composite: Places a cyan 23x52 rectangle at position (364, 164) then Places a cyan dot at position (169, 186) then Renders a blue line between points (234, 215) and (88, 49).
; PLAN: r0=364(x), r1=164(y), r2=23(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x), r6=186(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=234(x1), r11=215(y1), r12=88(x2), r13=49(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 164
LDI r2, 23
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 186
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 234
LDI r11, 215
LDI r12, 88
LDI r13, 49
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
