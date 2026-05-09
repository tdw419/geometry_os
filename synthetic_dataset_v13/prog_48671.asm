; DESCRIPTION: Composite: Creates a green rectangular region at (370, 146) spanning 99 by 43 pixels then Renders a white line between points (321, 255) and (70, 8).
; PLAN: r0=370(x), r1=146(y), r2=99(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x1), r6=255(y1), r7=70(x2), r8=8(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 146
LDI r2, 99
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 255
LDI r7, 70
LDI r8, 8
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
