; DESCRIPTION: Composite: Renders a white line between points (243, 217) and (273, 111) then Creates a green rectangular region at (72, 46) spanning 66 by 30 pixels.
; PLAN: r0=243(x1), r1=217(y1), r2=273(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=46(y), r7=66(width), r8=30(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 217
LDI r2, 273
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 46
LDI r7, 66
LDI r8, 30
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
