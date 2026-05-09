; DESCRIPTION: Composite: Creates a purple rectangular region at (2, 20) spanning 78 by 119 pixels then Places a blue line segment connecting (92, 231) to (59, 168) then Sets a single red pixel at (57, 204).
; PLAN: r0=2(x), r1=20(y), r2=78(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x1), r6=231(y1), r7=59(x2), r8=168(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=57(x), r11=204(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 2
LDI r1, 20
LDI r2, 78
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 231
LDI r7, 59
LDI r8, 168
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 57
LDI r11, 204
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
