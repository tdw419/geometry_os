; DESCRIPTION: Composite: Creates a yellow rectangular region at (473, 219) spanning 24 by 29 pixels then Places a orange dot at position (420, 83) then Renders a yellow line between points (162, 64) and (286, 2).
; PLAN: r0=473(x), r1=219(y), r2=24(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x), r6=83(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=162(x1), r11=64(y1), r12=286(x2), r13=2(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 473
LDI r1, 219
LDI r2, 24
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 83
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 162
LDI r11, 64
LDI r12, 286
LDI r13, 2
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
