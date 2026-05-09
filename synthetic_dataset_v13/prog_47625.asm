; DESCRIPTION: Composite: Places a cyan 86x60 rectangle at position (385, 92) then Draws a blue line from (266, 230) to (141, 146) then Places a yellow dot at position (154, 159).
; PLAN: r0=385(x), r1=92(y), r2=86(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=230(y1), r7=141(x2), r8=146(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=154(x), r11=159(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 385
LDI r1, 92
LDI r2, 86
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 230
LDI r7, 141
LDI r8, 146
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 159
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
