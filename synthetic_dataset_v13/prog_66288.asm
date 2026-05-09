; DESCRIPTION: Composite: Renders a green line between points (415, 116) and (486, 225) then Creates a yellow rectangular region at (361, 132) spanning 17 by 60 pixels.
; PLAN: r0=415(x1), r1=116(y1), r2=486(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=132(y), r7=17(width), r8=60(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 116
LDI r2, 486
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 132
LDI r7, 17
LDI r8, 60
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
