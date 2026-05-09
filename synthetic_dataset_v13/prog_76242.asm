; DESCRIPTION: Composite: Creates a green rectangular region at (264, 45) spanning 16 by 57 pixels then Places a red dot at position (385, 53) then Draws a magenta line from (475, 137) to (417, 129).
; PLAN: r0=264(x), r1=45(y), r2=16(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x), r6=53(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=475(x1), r11=137(y1), r12=417(x2), r13=129(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 45
LDI r2, 16
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 53
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 475
LDI r11, 137
LDI r12, 417
LDI r13, 129
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
