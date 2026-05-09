; DESCRIPTION: Composite: Sets a single orange pixel at (62, 96) then Places a blue 65x15 rectangle at position (181, 44) then Renders a green line between points (13, 233) and (0, 69).
; PLAN: r0=62(x), r1=96(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=44(y), r7=65(width), r8=15(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=13(x1), r11=233(y1), r12=0(x2), r13=69(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 96
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 181
LDI r6, 44
LDI r7, 65
LDI r8, 15
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 233
LDI r12, 0
LDI r13, 69
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
