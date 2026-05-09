; DESCRIPTION: Composite: Renders a orange box of size 59x120 starting at (449, 102) then Draws a green line from (198, 58) to (489, 76) then Sets a single green pixel at (34, 168).
; PLAN: r0=449(x), r1=102(y), r2=59(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x1), r6=58(y1), r7=489(x2), r8=76(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=34(x), r11=168(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 449
LDI r1, 102
LDI r2, 59
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 58
LDI r7, 489
LDI r8, 76
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 168
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
