; DESCRIPTION: Composite: Places a black line segment connecting (363, 62) to (277, 14) then Creates a white rectangular region at (86, 63) spanning 74 by 100 pixels.
; PLAN: r0=363(x1), r1=62(y1), r2=277(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=63(y), r7=74(width), r8=100(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 62
LDI r2, 277
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 63
LDI r7, 74
LDI r8, 100
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
