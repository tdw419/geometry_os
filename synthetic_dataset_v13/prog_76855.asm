; DESCRIPTION: Composite: Places a cyan dot at position (105, 68) then Renders a yellow box of size 83x102 starting at (54, 153) then Places a yellow line segment connecting (56, 26) to (244, 246).
; PLAN: r0=105(x), r1=68(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=54(x), r6=153(y), r7=83(width), r8=102(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=56(x1), r11=26(y1), r12=244(x2), r13=246(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 68
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 54
LDI r6, 153
LDI r7, 83
LDI r8, 102
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 26
LDI r12, 244
LDI r13, 246
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
