; DESCRIPTION: Composite: Sets a single yellow pixel at (383, 222) then Places a red 22x69 rectangle at position (330, 47) then Renders a red line between points (86, 97) and (28, 160).
; PLAN: r0=383(x), r1=222(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=330(x), r6=47(y), r7=22(width), r8=69(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=86(x1), r11=97(y1), r12=28(x2), r13=160(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 222
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 330
LDI r6, 47
LDI r7, 22
LDI r8, 69
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 97
LDI r12, 28
LDI r13, 160
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
