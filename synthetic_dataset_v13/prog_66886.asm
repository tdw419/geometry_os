; DESCRIPTION: Composite: Sets a single cyan pixel at (245, 121) then Draws a blue line from (297, 70) to (8, 173) then Places a blue circle of radius 59 at center (266, 182).
; PLAN: r0=245(x), r1=121(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=297(x1), r6=70(y1), r7=8(x2), r8=173(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=266(x), r11=182(y), r12=59(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 121
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 297
LDI r6, 70
LDI r7, 8
LDI r8, 173
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 266
LDI r11, 182
LDI r12, 59
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
