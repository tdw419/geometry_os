; DESCRIPTION: Composite: Renders a green line between points (263, 59) and (507, 241) then Creates a white rectangular region at (417, 198) spanning 31 by 33 pixels.
; PLAN: r0=263(x1), r1=59(y1), r2=507(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=417(x), r6=198(y), r7=31(width), r8=33(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 59
LDI r2, 507
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 198
LDI r7, 31
LDI r8, 33
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
