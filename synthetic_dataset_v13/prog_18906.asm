; DESCRIPTION: Composite: Sets a single black pixel at (283, 212) then Places a red 47x25 rectangle at position (287, 218) then Renders a purple line between points (463, 238) and (406, 202).
; PLAN: r0=283(x), r1=212(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=218(y), r7=47(width), r8=25(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=463(x1), r11=238(y1), r12=406(x2), r13=202(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 212
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 287
LDI r6, 218
LDI r7, 47
LDI r8, 25
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 238
LDI r12, 406
LDI r13, 202
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
