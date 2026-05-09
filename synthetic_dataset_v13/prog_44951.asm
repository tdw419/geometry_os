; DESCRIPTION: Composite: Draws a blue line from (213, 53) to (415, 65) then Creates a green rectangular region at (21, 159) spanning 41 by 66 pixels.
; PLAN: r0=213(x1), r1=53(y1), r2=415(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=21(x), r6=159(y), r7=41(width), r8=66(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 53
LDI r2, 415
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 159
LDI r7, 41
LDI r8, 66
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
