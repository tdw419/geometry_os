; DESCRIPTION: Composite: Sets a single yellow pixel at (415, 225) then Creates a orange rectangular region at (111, 113) spanning 106 by 65 pixels then Renders a white line between points (115, 171) and (103, 251).
; PLAN: r0=415(x), r1=225(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=113(y), r7=106(width), r8=65(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=115(x1), r11=171(y1), r12=103(x2), r13=251(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 225
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 111
LDI r6, 113
LDI r7, 106
LDI r8, 65
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 171
LDI r12, 103
LDI r13, 251
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
