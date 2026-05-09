; DESCRIPTION: Composite: Places a red line segment connecting (269, 234) to (277, 22) then Places a green 61x102 rectangle at position (276, 43) then Renders a cyan disk with center (335, 90) and radius 38.
; PLAN: r0=269(x1), r1=234(y1), r2=277(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=43(y), r7=61(width), r8=102(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=335(x), r11=90(y), r12=38(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 269
LDI r1, 234
LDI r2, 277
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 43
LDI r7, 61
LDI r8, 102
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 90
LDI r12, 38
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
