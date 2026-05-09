; DESCRIPTION: Composite: Draws a blue line from (53, 222) to (508, 147) then Places a blue 92x31 rectangle at position (20, 39) then Places a yellow dot at position (342, 62).
; PLAN: r0=53(x1), r1=222(y1), r2=508(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=39(y), r7=92(width), r8=31(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=342(x), r11=62(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 53
LDI r1, 222
LDI r2, 508
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 39
LDI r7, 92
LDI r8, 31
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 62
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
