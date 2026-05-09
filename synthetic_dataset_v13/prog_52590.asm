; DESCRIPTION: Composite: Places a white circle of radius 29 at center (104, 206) then Renders a green line between points (483, 68) and (222, 186) then Renders a cyan box of size 36x77 starting at (355, 111).
; PLAN: r0=104(x), r1=206(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x1), r6=68(y1), r7=222(x2), r8=186(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=355(x), r11=111(y), r12=36(width), r13=77(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 206
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 68
LDI r7, 222
LDI r8, 186
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 111
LDI r12, 36
LDI r13, 77
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
