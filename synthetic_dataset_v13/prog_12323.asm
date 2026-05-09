; DESCRIPTION: Composite: Places a red 120x10 rectangle at position (363, 111) then Sets a single green pixel at (225, 22) then Draws a yellow line from (309, 36) to (59, 54).
; PLAN: r0=363(x), r1=111(y), r2=120(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x), r6=22(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=309(x1), r11=36(y1), r12=59(x2), r13=54(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 111
LDI r2, 120
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 22
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 309
LDI r11, 36
LDI r12, 59
LDI r13, 54
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
