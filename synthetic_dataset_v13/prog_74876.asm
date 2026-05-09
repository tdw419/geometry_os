; DESCRIPTION: Composite: Sets a single cyan pixel at (49, 162) then Creates a magenta rectangular region at (177, 117) spanning 65 by 111 pixels then Draws a red line from (258, 254) to (415, 92).
; PLAN: r0=49(x), r1=162(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=117(y), r7=65(width), r8=111(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=258(x1), r11=254(y1), r12=415(x2), r13=92(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 162
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 177
LDI r6, 117
LDI r7, 65
LDI r8, 111
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 254
LDI r12, 415
LDI r13, 92
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
