; DESCRIPTION: Composite: Sets a single purple pixel at (411, 47) then Draws a blue rectangle at (305, 123) with width 53 and height 31 then Renders a red line between points (111, 57) and (26, 218).
; PLAN: r0=411(x), r1=47(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=123(y), r7=53(width), r8=31(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x1), r11=57(y1), r12=26(x2), r13=218(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 411
LDI r1, 47
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 305
LDI r6, 123
LDI r7, 53
LDI r8, 31
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 57
LDI r12, 26
LDI r13, 218
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
