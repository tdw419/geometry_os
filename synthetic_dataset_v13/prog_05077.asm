; DESCRIPTION: Composite: Sets a single yellow pixel at (288, 58) then Draws a cyan rectangle at (140, 60) with width 102 and height 82 then Renders a red line between points (445, 169) and (278, 1).
; PLAN: r0=288(x), r1=58(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=60(y), r7=102(width), r8=82(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=445(x1), r11=169(y1), r12=278(x2), r13=1(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 58
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 140
LDI r6, 60
LDI r7, 102
LDI r8, 82
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 169
LDI r12, 278
LDI r13, 1
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
