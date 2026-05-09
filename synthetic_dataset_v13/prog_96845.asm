; DESCRIPTION: Composite: Renders a blue line between points (66, 62) and (391, 56) then Creates a white rectangular region at (240, 47) spanning 107 by 112 pixels.
; PLAN: r0=66(x1), r1=62(y1), r2=391(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=47(y), r7=107(width), r8=112(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 62
LDI r2, 391
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 47
LDI r7, 107
LDI r8, 112
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
