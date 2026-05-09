; DESCRIPTION: Composite: Places a green circle of radius 49 at center (303, 158) then Creates a red rectangular region at (152, 145) spanning 30 by 68 pixels.
; PLAN: r0=303(x), r1=158(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x), r6=145(y), r7=30(width), r8=68(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 158
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 145
LDI r7, 30
LDI r8, 68
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
